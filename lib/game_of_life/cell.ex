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
    defstruct coordinates: %Coordinates{},
      max_coordinates: %Coordinates{},
      generation: 1,
      state_per_generation: [{1, :dead}]

    def nextState(_current, 3), do: :alive
    def nextState(:alive, 2), do: :alive
    def nextState(_current, _nb_living_surrounding), do: :dead
  end

  use GenServer

  # Public API
  def start_link(%Coordinates{} = coor, initialState, %Coordinates{} = max_coor) do
    GenServer.start_link(__MODULE__, %State{
      coordinates: coor,
      state_per_generation: [{1, initialState}],
      max_coordinates: max_coor,
     }, name: Coordinates.get_cell_name(coor))
  end

  def tick(%Coordinates{} = coor) do
    GenServer.call Coordinates.get_cell_name(coor), :tick
  end

  def get_state(%Coordinates{} = coor, generation) do
    GenServer.call Coordinates.get_cell_name(coor), {:get_state, generation}
  end

  # Instance implementation
  def init(state) do
    {:ok, state}
  end

  def handle_call(:tick, _from, %State{} = state) do
    nb_living_cells_surrounding =
      Coordinates.get_surrounding(state.coordinates, state.max_coordinates)
      |> Enum.map(&(get_state(&1, state.generation)))
      |> Enum.count(&(&1 == :alive))

    current_state =
      state.state_per_generation
      |> get_state_for_generation(state.generation)

    next_state = State.nextState(current_state, nb_living_cells_surrounding)
    next_generation = state.generation + 1
    next_state_per_generation =
      [{next_generation, next_state} | state.state_per_generation]
      |> Enum.take(5)

    {:reply, current_state, %State{
      state |
        state_per_generation: next_state_per_generation,
        generation: next_generation
    }}
  end

  def handle_call({:get_state, generation}, _from, %State{} = state) do
    cell_state_for_generation = get_state_for_generation(state.state_per_generation, generation)
    {:reply, cell_state_for_generation, state}
  end

  defp get_state_for_generation(state_per_generation, generation) do
    state_per_generation
    |> Enum.find_value(fn {state_generation, state} ->
      if state_generation == generation, do: state
    end)
  end
end
