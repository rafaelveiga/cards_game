defmodule CardsGame.Structs.Player do
  @max_life 10
  @required_keys [:life, :name]

  @enforce_keys @required_keys

  defstruct @required_keys

  def build(name) do
    %CardsGame.Structs.Player{
      life: @max_life,
      name: name
    }
  end
end
