defmodule Simetric.Mixfile do
  use Mix.Project

  def project() do
    [app: :simetric,
     version: "0.2.0",
     elixir: "~> 1.3",
     description: description(),
     package: package()]
  end

  def application() do
    [applications: []]
  end

  defp description() do
    "This library provides facilities to perform approximate string matching " <>
    "and measurement of string similarity/distance."
  end

  defp package() do
    [maintainers: ["Aleksei Magusev"],
     licenses: ["ISC"],
     links: %{"GitHub" => "https://github.com/lexmag/simetric"}]
  end
end
