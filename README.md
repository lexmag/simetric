# Simetric

[![Build Status](https://travis-ci.org/lexmag/simetric.svg "Build Status")](https://travis-ci.org/lexmag/simetric)
[![Module Version](https://img.shields.io/hexpm/v/simetric.svg)](https://hex.pm/packages/simetric)
[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/simetric/)
[![Total Download](https://img.shields.io/hexpm/dt/simetric.svg)](https://hex.pm/packages/simetric)
[![License](https://img.shields.io/hexpm/l/simetric.svg)](https://github.com/lexmag/simetric/blob/master/LICENSE)
[![Last Updated](https://img.shields.io/github/last-commit/lexmag/simetric.svg)](https://github.com/lexmag/simetric/commits/master)

Simetric provides facilities to perform approximate string matching and measurement of string similarity/distance.
The library is focusing on speed and completeness.

### Available metrics

* [Jaro](http://en.wikipedia.org/wiki/Jaro-Winkler_distance) (has been moved to [Elixir's standard library](https://hexdocs.pm/elixir/String.html#jaro_distance/2))
* [Jaro–Winkler](http://en.wikipedia.org/wiki/Jaro-Winkler_distance)
* [Levenshtein](http://en.wikipedia.org/wiki/Levenshtein_distance)

## Installation

Add `:simetric` as a dependency to your `mix.exs` file:

```elixir
defp deps do
  [
    {:simetric, "~> 0.2.0"}
  ]
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

## Copyright and License

Copyright (c) 2014, Aleksei Magusev

Simetric is released under [the ISC license](./LICENSE.md).
