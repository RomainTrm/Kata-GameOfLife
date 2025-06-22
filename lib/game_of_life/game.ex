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

    GenServer.start_link(__MODULE__, cells, name: __MODULE__)
  end

  def tick do
    GenServer.cast(__MODULE__, :tick)
  end

  # Instance implementation
  def init(state) do
    {:ok, state}
  end

  def handle_cast(:tick, cells) do
    cells
    |> Enum.map(fn cell ->
      state = GameOfLife.Cell.tick(cell)
      {cell, state}
    end)
    |> GameOfLife.Display.display()

    {:noreply, cells}
  end
end
