defmodule CardsGame do
  alias CardsGame.Structs.{Player, Deck}
  alias CardsGame.GameState
  alias CardsGame.Actions.BattleCards

  def start do
    player = Player.build("Rafael")
    computer = Player.build("Computer")
    deck = Deck.build()

    GameState.start(player, computer, deck)
  end

  def battle_cards do
    BattleCards.start()
  end
end
