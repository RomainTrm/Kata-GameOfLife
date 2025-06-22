defmodule GameOfLife.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    cells = build_cell_coordinates GameOfLife.Patterns.gosper_glider_gun()
    cells_names = Enum.map(cells, fn {coor, _} -> GameOfLife.Cell.Coordinates.get_cell_name(coor) end)

    max_coordinates =
      cells
      |> Enum.map(fn {%GameOfLife.Cell.Coordinates{} = coor, _} -> coor end)
      |> Enum.max()

    children =
      ([
        {GameOfLife.Game, nil},
      ]
      ++
      Enum.map(cells, fn {%GameOfLife.Cell.Coordinates{} = coor, initial_state} ->
        {GameOfLife.Cell, {coor, initial_state, max_coordinates}}
      end)
      ++
      [
        {GameOfLife.Display, {cells_names, Enum.count(cells)}},
        {GameOfLife.Ticker, nil}
      ])

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GameOfLife.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp build_cell_coordinates(cells) do
    cells
    |> Enum.with_index(fn row, x ->
      row
      |> Enum.with_index(fn cell, y ->
        {%GameOfLife.Cell.Coordinates{x: x, y: y}, cell}
      end)
    end)
    |> Enum.flat_map(&(&1))
  end
end
