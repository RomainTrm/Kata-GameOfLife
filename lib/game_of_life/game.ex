defmodule GameOfLife.Game do
  use GenServer

  # Public API
  def start_link(initialState) do
    max_coordinates =
      initialState
      |> Enum.map(fn {%GameOfLife.Cell.Coordinates{} = coor, _} ->
        coor
      end)
      |> Enum.max

    cells =
      initialState
      |> Enum.map(fn {%GameOfLife.Cell.Coordinates{} = coor, initial_state} ->
        GameOfLife.Cell.start_link(coor, initial_state, max_coordinates)
        coor
      end)

    GenServer.start_link(__MODULE__, {cells, max_coordinates}, name: __MODULE__)
  end

  def tick do
    GenServer.cast(__MODULE__, :tick)
  end

  # Instance implementation
  def init(state) do
    {:ok, state}
  end

  def handle_cast(:tick, {cells, max_coordinates}) do
    cells |> Enum.map(&(GameOfLife.Cell.tick/1))

    cells
    |> Enum.map(fn cell ->
      name = GameOfLife.Cell.Coordinates.get_cell_name(cell)
      state = GameOfLife.Cell.get_state(cell)
      {name, state}
    end)
    |> GameOfLife.Display.display(max_coordinates)

    {:noreply, {cells, max_coordinates}}
  end
end
