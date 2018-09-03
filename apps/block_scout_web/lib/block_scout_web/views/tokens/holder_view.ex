defmodule BlockScoutWeb.Tokens.HolderView do
  use BlockScoutWeb, :view

  alias BlockScoutWeb.Tokens.{OverviewView, TokenView}

  def total_supply_percentage(value, total_supply) do
    result =
      value
      |> Decimal.div(total_supply)
      |> Decimal.mult(100)
      |> Decimal.round(4)
      |> Decimal.to_string()

    result <> "%"
  end
end
