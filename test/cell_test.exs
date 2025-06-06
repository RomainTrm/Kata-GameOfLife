defmodule Cell.Test do
  use ExUnit.Case

  test "should change state on tick and compute next state" do
    cells = [
      {%GameOfLife.Cell.Coordinates{x: 0, y: 0}, :dead},
      {%GameOfLife.Cell.Coordinates{x: 0, y: 1}, :dead},
      {%GameOfLife.Cell.Coordinates{x: 0, y: 2}, :dead},
      {%GameOfLife.Cell.Coordinates{x: 1, y: 0}, :alive},
      {%GameOfLife.Cell.Coordinates{x: 1, y: 1}, :alive},
      {%GameOfLife.Cell.Coordinates{x: 1, y: 2}, :alive},
      {%GameOfLife.Cell.Coordinates{x: 2, y: 0}, :dead},
      {%GameOfLife.Cell.Coordinates{x: 2, y: 1}, :dead},
      {%GameOfLife.Cell.Coordinates{x: 2, y: 2}, :dead},
    ]

    cells |> Enum.map(fn {coord, initial_state} ->
      GameOfLife.Cell.start_link(coord, initial_state)
    end)

    assert GameOfLife.Cell.get_state(%GameOfLife.Cell.Coordinates{x: 1, y: 1}) == :alive
    assert GameOfLife.Cell.get_state(%GameOfLife.Cell.Coordinates{x: 2, y: 0}) == :dead

    cells |> Enum.map(fn {coord, _} -> GameOfLife.Cell.tick(coord) end)
    assert GameOfLife.Cell.get_next_state(%GameOfLife.Cell.Coordinates{x: 1, y: 1}, 1) == :alive
    assert GameOfLife.Cell.get_next_state(%GameOfLife.Cell.Coordinates{x: 1, y: 0}, 1) == :dead
    assert GameOfLife.Cell.get_next_state(%GameOfLife.Cell.Coordinates{x: 0, y: 1}, 1) == :alive

    cells |> Enum.map(fn {coord, _} -> GameOfLife.Cell.tick(coord) end)
    assert GameOfLife.Cell.get_next_state(%GameOfLife.Cell.Coordinates{x: 1, y: 1}, 2) == :alive
    assert GameOfLife.Cell.get_next_state(%GameOfLife.Cell.Coordinates{x: 1, y: 0}, 2) == :alive
    assert GameOfLife.Cell.get_next_state(%GameOfLife.Cell.Coordinates{x: 0, y: 1}, 2) == :dead

    assert GameOfLife.Cell.get_state(%GameOfLife.Cell.Coordinates{x: 1, y: 1}) == :alive
    assert GameOfLife.Cell.get_state(%GameOfLife.Cell.Coordinates{x: 1, y: 0}) == :dead
    assert GameOfLife.Cell.get_state(%GameOfLife.Cell.Coordinates{x: 0, y: 1}) == :alive
  end
end
