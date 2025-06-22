defmodule GameOfLife.Ticker do
  @interval 100 # 100 milliseconds

  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def init(_) do
    next_tick()
    {:ok, nil}
  end

  def handle_info(:next_tick, nil) do
    next_tick()
    GameOfLife.Game.tick
    { :noreply, nil }
  end

  def next_tick do
    Process.send_after(self(), :next_tick, @interval)
  end
end
