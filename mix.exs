defmodule Simetric.Mixfile do
  use Mix.Project

  @source_url "https://github.com/lexmag/simetric"
  @version "0.2.0"

  def project() do
    [
      app: :simetric,
      version: @version,
      elixir: "~> 1.3",
      package: package(),
      deps: deps(),
      docs: docs()
    ]
  end

  def application() do
    [applications: []]
  end

  defp package() do
    [
      description: "This library provides facilities to perform approximate string matching "
        <> "and measurement of string similarity/distance.",
      maintainers: ["Aleksei Magusev"],
      licenses: ["ISC"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
    ]
  end

  defp docs do
    [
      extras: [{:"LICENSE.md", [title: "License"]}, "README.md"],
      main: "readme",
      source_url: @source_url,
      source_ref: "#{@version}",
      formatters: ["html"]
    ]
  end
end
