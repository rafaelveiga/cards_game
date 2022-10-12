defmodule CardsGame.Structs.Deck do
  defstruct [:cards]

  def build() do
    values = [
      "Ace",
      "Two",
      "Three",
      "Four",
      "Five",
      "Six",
      "Seven",
      "Eight",
      "Nine",
      "Ten",
      "Jack",
      "Queen",
      "King"
    ]

    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    cards =
      for suit <- suits, value <- values do
        "#{value} of #{suit}"
      end

    %CardsGame.Structs.Deck{
      cards: cards
    }
  end
end
