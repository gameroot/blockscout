defmodule BlockScoutWeb.Tokens.HolderViewTest do
  use BlockScoutWeb.ConnCase, async: true

  alias BlockScoutWeb.Tokens.HolderView
  alias Explorer.Chain.{Address.TokenBalance, Token}

  describe "total_supply_percentage/2" do
    test "returns the percentage of the Token total supply" do
      %Token{total_supply: total_supply} = build(:token, total_supply: 1000)
      %TokenBalance{value: value} = build(:token_balance, value: 200)

      assert HolderView.total_supply_percentage(value, total_supply) == "20.0%"
    end

    test "considers 4 decimals" do
      %Token{total_supply: total_supply} = build(:token, total_supply: 100_000_009)
      %TokenBalance{value: value} = build(:token_balance, value: 500)

      assert HolderView.total_supply_percentage(value, total_supply) == "0.0005%"
    end
  end
end
