# Simetric

[![Build Status](https://travis-ci.org/lexmag/simetric.svg "Build Status")](https://travis-ci.org/lexmag/simetric)
[![Hex Version](https://img.shields.io/hexpm/v/simetric.svg "Hex Version")](https://hex.pm/packages/simetric)

Simetric provides facilities to perform approximate string matching and measurement of string similarity/distance.
The library is focusing on speed and completeness.

### Available metrics

* [Jaro](http://en.wikipedia.org/wiki/Jaro-Winkler_distance) (has been moved to [Elixir's standard library](https://hexdocs.pm/elixir/String.html#jaro_distance/2))
* [Jaro–Winkler](http://en.wikipedia.org/wiki/Jaro-Winkler_distance)
* [Levenshtein](http://en.wikipedia.org/wiki/Levenshtein_distance)

## Installation

Add Simetric as a dependency to your `mix.exs` file:

```elixir
defp deps do
  [{:simetric, "~> 0.2.0"}]
end
```

Then, run `mix deps.get` in your shell to fetch the new dependency.

## Usage

__Jaro–Winkler:__
```elixir
Simetric.Jaro.Winkler.compare("dwayne", "duane") # => 0.8400000000000001
Simetric.Jaro.Winkler.compare("hardin", "martinez") # => 0.7222222222222222
Simetric.Jaro.Winkler.compare("same", "same") # => 1.0
```

__Levenshtein:__
```elixir
Simetric.Levenshtein.compare("gumbo", "gambol") # => 2
Simetric.Levenshtein.compare("kitten", "sitting") # => 3
```

## License

Simetric is released under [the ISC license](LICENSE).
