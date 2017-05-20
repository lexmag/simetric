defmodule Simetric.Jaro do
  @moduledoc false

  def compare(string1, string2) do
    IO.warn "Simetric.Jaro.compare/2 is deprecated, use String.jaro_distance/2 instead"
    String.jaro_distance(string1, string2)
  end
end
