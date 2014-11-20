defmodule Simetric.Jaro do
  if Application.get_env(:simetric, :native, false) do
    @compile :native
  end

  def compare(str, str), do: 1.0
  def compare(_str, ""), do: 0.0
  def compare("", _str), do: 0.0

  def compare(str1, str2) do
    {chars1, len1} = decompose(str1)
    {chars2, len2} = decompose(str2)

    case match(chars1, len1, chars2, len2) do
      {0, _trans} -> 0.0
      {comm, trans} ->
        ((comm / len1) +
         (comm / len2) +
         ((comm - trans) / comm)) / 3
    end
  end

  @compile {:inline, decompose: 1}
  defp decompose(str) do
    chars = String.graphemes(str)

    {chars, length(chars)}
  end

  defp match(chars1, len1, chars2, len2) do
    if len1 < len2 do
      match(chars1, chars2, div(len2, 2) - 1)
    else
      match(chars2, chars1, div(len1, 2) - 1)
    end
  end

  defp match(chars1, chars2, lim) do
    match(chars1, chars2, {0, lim}, {0, 0, -1}, 0)
  end

  defp match([char | rest], chars, range, state, idx) do
    {chars, state} = submatch(char, chars, range, state, idx)

    case range do
      {lim, lim} -> match(rest, tl(chars), range, state, idx + 1)
      {pre, lim} -> match(rest, chars, {pre + 1, lim}, state, idx + 1)
    end
  end

  defp match([], _, _, {comm, trans, _}, _), do: {comm, trans}

  defp submatch(char, chars, {pre, _} = range, state, idx) do
    case detect(char, chars, range) do
      nil -> {chars, state}
      {subidx, chars} ->
        {chars, proceed(state, idx - pre + subidx)}
    end
  end

  defp detect(char, chars, {pre, lim}) do
    detect(char, chars, pre + 1 + lim, 0, [])
  end

  defp detect(_char, _chars, 0, _idx, _acc), do: nil
  defp detect(_char, [], _lim, _idx, _acc),  do: nil

  defp detect(char, [char | rest], _lim, idx, acc),
    do: {idx, Enum.reverse(acc, [nil | rest])}

  defp detect(char, [other | rest], lim, idx, acc),
    do: detect(char, rest, lim - 1, idx + 1, [other | acc])

  defp proceed({comm, trans, former}, current) do
    if current < former do
      {comm + 1, trans + 1, current}
    else
      {comm + 1, trans, current}
    end
  end
end
