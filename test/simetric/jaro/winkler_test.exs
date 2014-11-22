defmodule Simetric.Jaro.WinklerTest do
  use ExUnit.Case

  cases = %{
    ["same", "same"] => 1.0,
    ["any", ""] => 0.0,
    ["", "any"] => 0.0,
    ["martha", "marhta"] => 0.9611111111111111,
    ["martha", "marhha"] => 0.9222222222222223,
    ["marhha", "martha"] => 0.9222222222222223,
    ["dwayne", "duane"] => 0.8400000000000001,
    ["dixon", "dicksonx"] => 0.8133333333333332,
    ["xdicksonx", "dixon"] => 0.7851851851851852,
    ["shackleford", "shackelford"] => 0.9818181818181818,
    ["dunningham", "cunnigham"] => 0.8962962962962964,
    ["nichleson", "nichulson"] => 0.9555555555555556,
    ["jones", "johnson"] => 0.8323809523809523,
    ["massey", "massie"] => 0.9333333333333333,
    ["abroms", "abrams"] => 0.9222222222222223,
    ["hardin", "martinez"] => 0.7222222222222222,
    ["itman", "smith"] => 0.4666666666666666,
    ["jeraldine", "geraldine"] => 0.9259259259259259,
    ["michelle", "michael"] => 0.9214285714285715,
    ["julies", "julius"] => 0.9333333333333333,
    ["tanya", "tonya"] => 0.88,
    ["sean", "susan"] => 0.8049999999999999,
    ["jon", "john"] => 0.9333333333333333,
    ["jon", "jan"] => 0.7999999999999999
  }

  for {input, distance} <- cases do
    test "compare #{inspect input}" do
      assert Simetric.Jaro.Winkler.compare(unquote_splicing(input)) == unquote(distance)
    end
  end
end
