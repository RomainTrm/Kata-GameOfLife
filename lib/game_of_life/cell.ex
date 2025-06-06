defmodule GameOfLife.Cell do
  defmodule Coordinates do
    defstruct x: 0, y: 0

    def get_cell_name(%Coordinates{:x => x, :y => y}), do: :"#{x}-#{y}"

    def get_surrounding(
      %Coordinates{:x => x, :y => y} = coor,
      %Coordinates{:x => max_x, :y => max_y}) do
      x-1..x+1
      |> Enum.filter(&(&1 >= 0 && &1 <= max_x))
      |> Enum.flat_map(fn x ->
        y-1..y+1
        |> Enum.filter(&(&1 >= 0 && &1 <= max_y))
        |> Enum.map(fn y -> %Coordinates{x: x, y: y} end)
      end)
      |> Enum.filter(&(&1 != coor))
    end
  end

  defmodule State do
    defstruct coordinates: %Coordinates{}, max_coordinates: %Coordinates{}, generation: 0, current_state: :dead, next_state: :dead

    def nextState(_current, 3), do: :alive
    def nextState(:alive, 2), do: :alive
    def nextState(_current, _nb_living_surrounding), do: :dead
  end

  use GenServer

  # Public API
  def start_link(%Coordinates{} = coor, initialState, %Coordinates{} = max_coor) do
    GenServer.start_link(__MODULE__, %State{
      coordinates: coor,
      current_state: initialState,
      next_state: initialState,
      max_coordinates: max_coor,
     }, name: Coordinates.get_cell_name(coor))
  end

  def tick(%Coordinates{} = coor) do
    GenServer.call Coordinates.get_cell_name(coor), :tick
  end

  def get_state(%Coordinates{} = coor) do
    GenServer.call Coordinates.get_cell_name(coor), :get_state
  end

  def get_next_state(%Coordinates{} = coor, generation) do
    GenServer.call Coordinates.get_cell_name(coor), {:get_next_state, generation}
  end

  # Instance implementation
  def init(state) do
    {:ok, state}
  end

  def handle_call(:tick, _from, %State{} = state) do
    nb_living_cells_surrounding =
      Coordinates.get_surrounding(state.coordinates, state.max_coordinates)
      |> Enum.map(&(get_next_state(&1, state.generation)))
      |> Enum.count(&(&1 == :alive))

    next_state =
      state.current_state
      |> State.nextState(nb_living_cells_surrounding)

    {:reply, nil, %State{
      state |
        current_state: state.next_state,
        next_state: next_state,
        generation: state.generation + 1
    }}
  end

  def handle_call(:get_state, _from, %State{} = state) do
      {:reply, state.current_state, state}
  end

  def handle_call({:get_next_state, generation}, _from, %State{} = state) do
    cond do
      state.generation == generation ->
        {:reply, state.next_state, state}
      state.generation == generation + 1 ->
        {:reply, state.current_state, state}
      true -> {:error, "invalid generation", state}
    end
  end
end
