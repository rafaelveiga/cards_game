defmodule CardsGame.GameState do
  use Agent

  def start(player, computer, deck) do
    initial_value = %{
      player: player,
      computer: computer,
      deck: deck,
      turn: 0
    }

    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end

  def info do
    Agent.get(__MODULE__, & &1)
  end
end
