defmodule Simetric.LevenshteinTest do
  use ExUnit.Case

  cases = %{
    # empty strings
    ["", ""] => 0,
    ["", "ab"] => 2,
    ["abc", ""] => 3,
    # equal strings
    ["a", "a"] => 0,
    ["abc", "abc"] => 0,
    # inserts only
    ["a", "ab"] => 1,
    ["b", "ab"] => 1,
    ["ac", "abc"] => 1,
    ["abcdefg", "xabxcdxxefxgx"] => 6,
    # deletions only
    ["a", ""] => 1,
    ["ab", "a"] => 1,
    ["ab", "b"] => 1,
    ["abc", "ac"] => 1,
    ["xabxcdxxefxgx", "abcdefg"] => 6,
    # substitutions only
    ["a", "b"] => 1,
    ["ab", "ac"] => 1,
    ["ac", "bc"] => 1,
    ["abc", "axc"] => 1,
    ["xabxcdxxefxgx", "1ab2cd34ef5g6"] => 6,
    # mixed operations
    ["example", "samples"] => 3,
    ["sturgeon", "urgently"] => 6,
    ["levenshtein", "frankenstein"] => 6,
    ["distance", "difference"] => 5
  }

  for {input, distance} <- cases do
    test "compare #{inspect input}" do
      assert Simetric.Levenshtein.compare(unquote_splicing(input)) == unquote(distance)
    end
  end
end
