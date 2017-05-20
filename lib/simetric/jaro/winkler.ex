defmodule Simetric.Jaro.Winkler do
  @moduledoc """
  An implementation of the [Jaro–Winkler](http://en.wikipedia.org/wiki/Jaro–Winkler_distance) distance metric.

  It is designed and best-suited for short strings such as person names.
  """

  @doc """
  Returns a floating-point number between 0 (equates to no similarity) and 1 (is an exact match)
  representing a distance between `string1` and `string2`.

  ## Examples

      iex> Simetric.Jaro.Winkler.compare("dwayne", "duane")
      0.8400000000000001
      iex> Simetric.Jaro.Winkler.compare("even", "odd")
      0.0

  """
  @spec compare(String.t, String.t) :: float

  def compare(string1, string2) do
    case Simetric.Jaro.compare(string1, string2) do
      0.0 ->
        0.0
      1.0 ->
        1.0
      dist ->
        common_prefix_length = common_prefix_length(string1, string2, 0, 4)
        dist + (common_prefix_length * 0.1 * (1 - dist))
    end
  end

  defp common_prefix_length(_string1, _string2, count, 0), do: count

  defp common_prefix_length(_string1, "", count, _limit), do: count

  defp common_prefix_length("", _string2, count, _limit), do: count

  defp common_prefix_length(string1, string2, count, limit) do
    {char, rest1} = String.next_grapheme(string1)
    case String.next_grapheme(string2) do
      {^char, rest2} ->
        common_prefix_length(rest1, rest2, count + 1, limit - 1)
      {_char, _rest} ->
        count
    end
  end
end
