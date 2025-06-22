defmodule GameOfLife.Display do
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
