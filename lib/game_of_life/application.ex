defmodule GameOfLife.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    blinker = [
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

    grenouille = [
        {%GameOfLife.Cell.Coordinates{x: 0, y: 0}, :dead},
        {%GameOfLife.Cell.Coordinates{x: 0, y: 1}, :dead},
        {%GameOfLife.Cell.Coordinates{x: 0, y: 2}, :dead},
        {%GameOfLife.Cell.Coordinates{x: 0, y: 3}, :dead},
        {%GameOfLife.Cell.Coordinates{x: 1, y: 0}, :dead},
        {%GameOfLife.Cell.Coordinates{x: 1, y: 1}, :alive},
        {%GameOfLife.Cell.Coordinates{x: 1, y: 2}, :alive},
        {%GameOfLife.Cell.Coordinates{x: 1, y: 3}, :alive},
        {%GameOfLife.Cell.Coordinates{x: 2, y: 0}, :alive},
        {%GameOfLife.Cell.Coordinates{x: 2, y: 1}, :alive},
        {%GameOfLife.Cell.Coordinates{x: 2, y: 2}, :alive},
        {%GameOfLife.Cell.Coordinates{x: 2, y: 3}, :dead},
        {%GameOfLife.Cell.Coordinates{x: 3, y: 0}, :dead},
        {%GameOfLife.Cell.Coordinates{x: 3, y: 1}, :dead},
        {%GameOfLife.Cell.Coordinates{x: 3, y: 2}, :dead},
        {%GameOfLife.Cell.Coordinates{x: 3, y: 3}, :dead},
    ]

    children = [
      # Starts a worker by calling: GameOfLife.Worker.start_link(arg)
      {GameOfLife.Game, grenouille}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GameOfLife.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
