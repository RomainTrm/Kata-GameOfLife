defmodule GameOfLife.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: GameOfLife.Worker.start_link(arg)
      {GameOfLife.Game, [
        {%GameOfLife.Cell.Coordinates{x: 0, y: 0}, :dead},
        {%GameOfLife.Cell.Coordinates{x: 0, y: 1}, :dead},
        {%GameOfLife.Cell.Coordinates{x: 0, y: 2}, :dead},
        {%GameOfLife.Cell.Coordinates{x: 1, y: 0}, :alive},
        {%GameOfLife.Cell.Coordinates{x: 1, y: 1}, :alive},
        {%GameOfLife.Cell.Coordinates{x: 1, y: 2}, :alive},
        {%GameOfLife.Cell.Coordinates{x: 2, y: 0}, :dead},
        {%GameOfLife.Cell.Coordinates{x: 2, y: 1}, :dead},
        {%GameOfLife.Cell.Coordinates{x: 2, y: 2}, :dead},
      ]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GameOfLife.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
