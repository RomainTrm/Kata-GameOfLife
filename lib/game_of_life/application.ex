defmodule GameOfLife.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: GameOfLife.Worker.start_link(arg)
      {GameOfLife.Game, build_cell_coordinates GameOfLife.Patterns.gosper_glider_gun()},
      {GameOfLife.Ticker, nil}
    ]

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
