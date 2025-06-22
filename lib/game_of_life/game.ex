defmodule GameOfLife.Game do
  use GenStage

  # Public API
  def start_link() do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def tick do
    GenStage.cast(__MODULE__, :tick)
  end

  # Instance implementation
  def init(_) do
    {:producer, nil}
  end

  def handle_cast(:tick, _) do
    {:noreply, [:tick], nil}
  end
end
