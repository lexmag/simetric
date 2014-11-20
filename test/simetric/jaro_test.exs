defmodule Simetric.JaroTest do
  use ExUnit.Case

  cases = %{
    ["same", "same"] => 1.0,
    ["any", ""] => 0.0,
    ["", "any"] => 0.0,
    ["martha", "marhta"] => 0.9444444444444445,
    ["martha", "marhha"] => 0.888888888888889,
    ["marhha", "martha"] => 0.888888888888889,
    ["dwayne", "duane"] => 0.8222222222222223,
    ["dixon", "dicksonx"] => 0.7666666666666666,
    ["xdicksonx", "dixon"] => 0.7851851851851852,
    ["shackleford", "shackelford"] => 0.9696969696969697,
    ["dunningham", "cunnigham"] => 0.8962962962962964,
    ["nichleson", "nichulson"] => 0.9259259259259259,
    ["jones", "johnson"] => 0.7904761904761904,
    ["massey", "massie"] => 0.888888888888889,
    ["abroms", "abrams"] => 0.888888888888889,
    ["hardin", "martinez"] => 0.7222222222222222,
    ["itman", "smith"] => 0.4666666666666666,
    ["jeraldine", "geraldine"] => 0.9259259259259259,
    ["michelle", "michael"] => 0.8690476190476191,
    ["julies", "julius"] => 0.888888888888889,
    ["tanya", "tonya"] => 0.8666666666666667,
    ["sean", "susan"] => 0.7833333333333333,
    ["jon", "john"] => 0.9166666666666666,
    ["jon", "jan"] => 0.7777777777777777
  }

  for {input, distance} <- cases do
    test "compare #{inspect input}" do
      assert Simetric.Jaro.compare(unquote_splicing(input)) == unquote(distance)
    end
  end
end
