defmodule GameOfLife.Display do
  use GenStage

  defmodule State do
    defstruct nb_cells: 0,
              cells_states: []
  end

  # Public API
  def start_link({cells_names, nb_cells}) do
    GenStage.start_link(__MODULE__, {cells_names, nb_cells}, name: __MODULE__)
  end

  # Instance implementation
  def init({cells_names, nb_cells}) do
    state = %State{
      nb_cells: nb_cells,
      cells_states: %{}
    }
    {:consumer, state, subscribe_to: [cells_names]}
  end

  def handle_events([{:new_generation, cell_coordinates, cell_generation, cell_state}], _from, %State{} = state) do
    cells = Map.get(state.cells_states, cell_generation, [])
    all_cells = [{cell_coordinates, cell_state} | cells]

    if Enum.count(all_cells) == state.nb_cells do
      display(all_cells)
      {:noreply, [], %State{state | cells_states: Map.delete(state.cells_states, cell_generation)}}
    else
      {:noreply, [], %State{state | cells_states: Map.put(state.cells_states, cell_generation, all_cells)}}
    end
  end

  def display(cells) do
    generation =
      cells
      |> Enum.sort_by(fn {coordinates, _state} -> coordinates end)
      |> Enum.map(fn {coordinates, state} ->
        coordinateY = Map.get(coordinates, :y)
        is_new_line = coordinateY == 0
        cell_state =
          cond do
            state == :alive -> "X"
            state == :dead -> "⠀"
            true -> raise "Error"
          end
        {is_new_line, cell_state}
      end)
      |> Enum.reduce("",
        fn
          {true, cell_state}, acc -> acc <> "
            " <> cell_state
          {false, cell_state}, acc -> acc <> cell_state
        end
      )

    IEx.Helpers.clear
    IO.puts generation
  end
end
