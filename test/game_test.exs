defmodule Cell.Test do
  use ExUnit.Case

  # This test doesn't work, apparently this not how we're supposed to test genservers
  # Processes don't seem to communicate (or even exist) when executing
  # For example: first assertion fail to receive the expected initial state (no computation happend yet)
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

    GameOfLife.Game.start_link(cells)

    assert GameOfLife.Cell.get_state(%GameOfLife.Cell.Coordinates{x: 1, y: 1}, 1) == :alive
    assert GameOfLife.Cell.get_state(%GameOfLife.Cell.Coordinates{x: 1, y: 0}, 1) == :alive
    assert GameOfLife.Cell.get_state(%GameOfLife.Cell.Coordinates{x: 0, y: 1}, 1) == :dead

    GameOfLife.Game.tick
    assert GameOfLife.Cell.get_state(%GameOfLife.Cell.Coordinates{x: 1, y: 1}, 2) == :alive
    assert GameOfLife.Cell.get_state(%GameOfLife.Cell.Coordinates{x: 1, y: 0}, 2) == :dead
    assert GameOfLife.Cell.get_state(%GameOfLife.Cell.Coordinates{x: 0, y: 1}, 2) == :alive

    GameOfLife.Game.tick
    assert GameOfLife.Cell.get_state(%GameOfLife.Cell.Coordinates{x: 1, y: 1}, 3) == :alive
    assert GameOfLife.Cell.get_state(%GameOfLife.Cell.Coordinates{x: 1, y: 0}, 3) == :alive
    assert GameOfLife.Cell.get_state(%GameOfLife.Cell.Coordinates{x: 0, y: 1}, 3) == :dead
  end
end
