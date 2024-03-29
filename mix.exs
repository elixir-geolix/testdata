defmodule Geolix.TestData.MixProject do
  use Mix.Project

  @url_changelog "https://hexdocs.pm/geolix_testdata/changelog.html"
  @url_github "https://github.com/elixir-geolix/testdata"
  @version "0.7.0-dev"

  def project do
    [
      app: :geolix_testdata,
      name: "Geolix Test Data Provider",
      version: @version,
      elixir: "~> 1.9",
      deps: deps(),
      description: "Geolix Test Data Provider",
      dialyzer: dialyzer(),
      docs: docs(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:inets, :public_key, :ssl]
    ]
  end

  defp deps do
    [
      {:castore, "~> 0.1.0 or ~> 1.0"},
      {:credo, "~> 1.7", only: :dev, runtime: false},
      {:dialyxir, "~> 1.3", only: :dev, runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp dialyzer do
    [
      flags: [
        :error_handling,
        :underspecs,
        :unmatched_returns
      ],
      plt_core_path: "plts",
      plt_local_path: "plts"
    ]
  end

  defp docs do
    [
      extras: [
        "CHANGELOG.md",
        LICENSE: [title: "License"],
        "README.md": [title: "Overview"]
      ],
      formatters: ["html"],
      main: "Geolix.TestData",
      source_ref: "v#{@version}",
      source_url: @url_github
    ]
  end

  defp package do
    [
      files: ["CHANGELOG.md", "LICENSE", "mix.exs", "README.md", "lib", "priv"],
      licenses: ["Apache-2.0"],
      links: %{
        "Changelog" => @url_changelog,
        "GitHub" => @url_github
      }
    ]
  end
end
