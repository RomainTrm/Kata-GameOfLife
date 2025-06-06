defmodule Cell.State.Test do
  use ExUnit.Case

  test "A dead cell turns alive when exactly 3 living neighbor" do
    newCell = GameOfLife.Cell.State.nextState(:dead, 3)
    assert newCell == :alive
  end

  test "A dead cell remains dead when not 3 living neighbor" do
    [0, 1, 2, 4, 5, 6, 7, 8, 9]
    |> Enum.map(fn nb_living_cells ->
      newCell = GameOfLife.Cell.State.nextState(:dead, nb_living_cells)
      assert newCell == :dead
    end)
  end

  test "A living cell remains alive when having 2 or 3 living neighbor" do
    [2, 3]
    |> Enum.map(fn nb_living_cells ->
      newCell = GameOfLife.Cell.State.nextState(:alive, nb_living_cells)
      assert newCell == :alive
    end)
  end

  test "A living cell dies alive when not having 2 or 3 living neighbor" do
    [0, 1, 4, 5, 6, 7, 8]
    |> Enum.map(fn nb_living_cells ->
      newCell = GameOfLife.Cell.State.nextState(:alive, nb_living_cells)
      assert newCell == :dead
    end)
  end
end
