defmodule Cell.Coordinates.Test do
  use ExUnit.Case

  test "Return surrounding coordinates of the cell" do
    coordinates = %GameOfLife.Cell.Coordinates{ x: 1, y: 3 }
    max = %GameOfLife.Cell.Coordinates{ x: 2, y: 4 }
    result = GameOfLife.Cell.Coordinates.get_surrounding(coordinates, max)
    expected = [
      %GameOfLife.Cell.Coordinates{ x: 1 - 1, y: 3 - 1 },
      %GameOfLife.Cell.Coordinates{ x: 1 - 1, y: 3 },
      %GameOfLife.Cell.Coordinates{ x: 1 - 1, y: 3 + 1 },
      %GameOfLife.Cell.Coordinates{ x: 1, y: 3 - 1 },
      %GameOfLife.Cell.Coordinates{ x: 1, y: 3 + 1 },
      %GameOfLife.Cell.Coordinates{ x: 1 + 1, y: 3 - 1 },
      %GameOfLife.Cell.Coordinates{ x: 1 + 1, y: 3 },
      %GameOfLife.Cell.Coordinates{ x: 1 + 1, y: 3 + 1 },
    ]
    assert result == expected
  end

  test "Return surrounding coordinates of the cell without negative coordinates" do
    coordinates = %GameOfLife.Cell.Coordinates{ x: 0, y: 0 }
    max = %GameOfLife.Cell.Coordinates{ x: 2, y: 4 }
    result = GameOfLife.Cell.Coordinates.get_surrounding(coordinates, max)
    expected = [
      %GameOfLife.Cell.Coordinates{ x: 0, y: 1 },
      %GameOfLife.Cell.Coordinates{ x: 1, y: 0 },
      %GameOfLife.Cell.Coordinates{ x: 1, y: 1 },
    ]
    assert result == expected
  end

  test "Return surrounding coordinates of the cell without coordinates greater than the max" do
    coordinates = %GameOfLife.Cell.Coordinates{ x: 1, y: 3 }
    result = GameOfLife.Cell.Coordinates.get_surrounding(coordinates, coordinates)
    expected = [
      %GameOfLife.Cell.Coordinates{ x: 1 - 1, y: 3 - 1 },
      %GameOfLife.Cell.Coordinates{ x: 1 - 1, y: 3 },
      %GameOfLife.Cell.Coordinates{ x: 1, y: 3 - 1 },
    ]
    assert result == expected
  end
end
