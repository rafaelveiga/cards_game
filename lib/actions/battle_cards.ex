defmodule CardsGame.Actions.BattleCards do
  alias CardsGame.GameState

  def start() do
    player_card = draw_card()
    computer_card = draw_card()

    compare_cards([player_card, computer_card])
  end

  def draw_card() do
    {card, new_deck} =
      GameState.info()
      |> Map.get(:deck)
      |> Map.get(:cards)
      |> Enum.split(1)

    GameState.update(:deck, %{:cards => new_deck})

    hd(card)
  end

  def compare_cards(card_list) do
    card_list
    |> Enum.map(&String.split(&1, "of"))
    # why
    |> Enum.map(fn s -> Enum.map(s, &String.split(&1)) end)
    |> IO.inspect()
  end
end
