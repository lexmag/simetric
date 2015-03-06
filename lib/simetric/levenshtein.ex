defmodule Simetric.Levenshtein do
  @moduledoc """
  The implementation of the [Levenshtein](http://en.wikipedia.org/wiki/Levenshtein_distance) distance metric.
  """

  @doc """
  Returns an integer value representing the minimum number of
  single-character edits (i.e. insertions, deletions or substitutions)
  required to change `str1` into the `str2`.

  ## Examples

      iex> Simetric.Levenshtein.compare("kitten", "sitting")
      3

  """
  @spec compare(String.t, String.t) :: non_neg_integer

  def compare(str, str), do: 0
  def compare(str, ""),  do: String.length(str)
  def compare("", str),  do: String.length(str)

  def compare(str1, str2) do
    chars1 = String.graphemes(str1)
    chars2 = String.graphemes(str2)
    distance(chars1, chars2, length(chars2)..0, 1)
  end

  defp distance([], _, [result | _], _), do: result

  defp distance([char | rest], chars2, distlist, step) do
    distlist = proceed(char, chars2, Enum.reverse(distlist), [step], step)
    distance(rest, chars2, distlist, step + 1)
  end

  defp proceed(_, [], _, acc, _), do: acc

  defp proceed(char1, [char2 | rest], [head | distlist], acc, score) do
    score = min(min(score + 1, hd(distlist) + 1), head + diff(char1, char2))
    proceed(char1, rest, distlist, [score | acc], score)
  end

  defp diff(char, char),
    do: 0
  defp diff(_, _),
    do: 1
end
