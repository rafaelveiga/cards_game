defmodule CardsGame do
  alias CardsGame.Structs.{Player, Deck}
  alias CardsGame.GameState

  def start do
    player = Player.build("Rafael")
    computer = Player.build("Computer")
    deck = Deck.build()

    GameState.start(player, computer, deck)
  end
end
