defmodule Cell.State.Test do
  use ExUnit.Case

  test "A dead cell turns alive when exactly 3 living neighbor" do
    deadCell = %GameOfLife.Cell.State{ state: :dead }
    newCell = GameOfLife.Cell.State.nextState(deadCell, 3)
    assert Map.get(newCell, :state) == :alive
  end

  test "A dead cell remains dead when not 3 living neighbor" do
    [0, 1, 2, 4, 5, 6, 7, 8, 9]
    |> Enum.map(fn nb_living_cells ->
      deadCell = %GameOfLife.Cell.State{ state: :dead }
      newCell = GameOfLife.Cell.State.nextState(deadCell, nb_living_cells)
      assert Map.get(newCell, :state) == :dead
    end)
  end

  test "A living cell remains alive when having 2 or 3 living neighbor" do
    [2, 3]
    |> Enum.map(fn nb_living_cells ->
      deadCell = %GameOfLife.Cell.State{ state: :alive }
      newCell = GameOfLife.Cell.State.nextState(deadCell, nb_living_cells)
      assert Map.get(newCell, :state) == :alive
    end)
  end

  test "A living cell dies alive when not having 2 or 3 living neighbor" do
    [0, 1, 4, 5, 6, 7, 8]
    |> Enum.map(fn nb_living_cells ->
      deadCell = %GameOfLife.Cell.State{ state: :alive }
      newCell = GameOfLife.Cell.State.nextState(deadCell, nb_living_cells)
      assert Map.get(newCell, :state) == :dead
    end)
  end

end
