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
  @spec compare(String.t, String.t, integer) :: non_neg_integer
  def compare(string1, string2, diff_score \\ 1)

  def compare(string, string, _), do: 0

  def compare(string1, "", _), do: String.length(string1)

  def compare("", string2, _), do: String.length(string2)

  def compare(string1, string2, diff_score) do
    chars1 = String.graphemes(string1)
    chars2 = String.graphemes(string2)
    distance(chars1, chars2, length(chars2)..0, 1, diff_score)
  end

  defp distance([], _, [result | _], _, _), do: result

  defp distance([char | rest], chars2, distlist, step, diff_score) do
    distlist = proceed(char, chars2, Enum.reverse(distlist), [step], step, diff_score)
    distance(rest, chars2, distlist, step + 1, diff_score)
  end

  defp proceed(_, [], _, acc, _, _), do: acc

  defp proceed(char1, [char2 | rest], [head | [prev | _] = distlist], acc, score, diff_score) do
    diff = if char1 == char2, do: 0, else: diff_score
    score = min(min(score + 1, prev + 1), head + diff)
    proceed(char1, rest, distlist, [score | acc], score, diff_score)
  end
end
