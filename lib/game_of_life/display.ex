defmodule GameOfLife.Display do
  def display(cells, max_coordinates) do
    IEx.Helpers.clear

    0..max_coordinates.x
    |> Enum.map(fn x ->
      0..max_coordinates.y
      |> Enum.map(fn y ->
        cell_name =
          %GameOfLife.Cell.Coordinates{x: x, y: y}
          |> GameOfLife.Cell.Coordinates.get_cell_name
        [cell_state] =
          cells
          |> Enum.filter(fn {name, _state} -> name == cell_name end)
          |> Enum.map(fn {_name, state} -> state end)
          |> Enum.take(1)

        cond do
          cell_state == :alive -> IO.write("X")
          cell_state == :dead -> IO.write("_")
          true -> raise "Error"
        end
      end)
      IO.puts("")
    end)
  end
end
