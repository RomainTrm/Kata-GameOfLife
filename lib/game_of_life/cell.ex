defmodule GameOfLife.Cell do
  defmodule Coordinates do
    defstruct x: 0, y: 0

    def get_cell_name(%Coordinates{:x => x, :y => y}) do
      :"#{x}-#{y}"
    end
  end

  defmodule State do
    defstruct coordinates: %Coordinates{}, generation: 0, state: :dead

    def nextState(current, 3) do
      %State{current | state: :alive}
    end

    def nextState(%State{state: :alive} = current, 2) do
      current
    end

    def nextState(current, _) do
      %State{current | state: :dead}
    end
  end

  def start_link(%Coordinates{} = coor, initialState) do
    Agent.start_link(fn -> %State{
      coordinates: coor,
      generation: 0,
      state: initialState
     } end, name: Coordinates.get_cell_name(coor))
  end

  def get_state(%Coordinates{} = coor) do
    Agent.get(Coordinates.get_cell_name(coor), fn dic -> Map.get(dic, :state) end)
  end
end
