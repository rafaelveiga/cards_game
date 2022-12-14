defmodule CardsGame.Actions.BattleCards do
  alias CardsGame.GameState

  def start() do
    player_card = draw_card()
    computer_card = draw_card()

    compare_cards(player_card, computer_card)
  end

  def update_game_state(loser) do
    GameState.update(
      loser,
      Map.put(
        GameState.get_key(loser),
        :life,
        GameState.get_key(loser).life - 1
      )
    )
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

  def compare_cards(player_card, computer_card) do
    player_card = parse_card(player_card)
    computer_card = parse_card(computer_card)

    result =
      compare_numbers(
        player_card
        |> hd()
        |> map_to_integer(),
        computer_card
        |> hd()
        |> map_to_integer()
      )

    case result do
      {:player} -> update_game_state(:computer)
      {:computer} -> update_game_state(:player)
      {:draw} -> "Draw"
    end
  end

  def parse_card(card) do
    card
    |> String.split("of")
    |> Enum.map(&String.trim(&1))
  end

  def compare_numbers(player_number, computer_number) do
    cond do
      player_number > computer_number -> {:player}
      player_number < computer_number -> {:computer}
      player_number == computer_number -> {:draw}
    end
  end

  def map_to_integer(text_number) do
    case text_number do
      "Ace" -> 1
      "Two" -> 2
      "Three" -> 3
      "Four" -> 4
      "Five" -> 5
      "Six" -> 6
      "Seven" -> 7
      "Eight" -> 8
      "Nine" -> 9
      "Ten" -> 10
      "Jack" -> 11
      "Queen" -> 12
      "King" -> 13
      _ -> nil
    end
  end
end
