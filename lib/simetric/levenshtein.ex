defmodule Simetric.Levenshtein do
  @moduledoc """
  The implementation of the [Levenshtein](http://en.wikipedia.org/wiki/Levenshtein_distance) distance metric.
  """

  @doc """
  Returns an integer representing the minimum number of
  single-character edits (i.e. insertions, deletions or substitutions)
  required to change `string1` into the `string2`.

  ## Examples

      iex> Simetric.Levenshtein.compare("kitten", "sitting")
      3

  """
  @spec compare(String.t, String.t) :: non_neg_integer
  def compare(string1, string2)

  def compare(string, string), do: 0

  def compare(string1, ""), do: String.length(string1)

  def compare("", string2), do: String.length(string2)

  def compare(string1, string2) do
    chars1 = String.graphemes(string1)
    chars2 = String.graphemes(string2)
    distance(chars1, chars2, length(chars2)..0, 1)
  end

  defp distance([], _, [result | _], _), do: result

  defp distance([char | rest], chars2, distlist, step) do
    distlist = proceed(char, chars2, Enum.reverse(distlist), [step], step)
    distance(rest, chars2, distlist, step + 1)
  end

  defp proceed(_, [], _, acc, _), do: acc

  defp proceed(char1, [char2 | rest], [head | [prev | _] = distlist], acc, score) do
    diff = if char1 == char2, do: 0, else: 1
    score = min(min(score + 1, prev + 1), head + diff)
    proceed(char1, rest, distlist, [score | acc], score)
  end
end
