defmodule Geolix.TestData.MixProject do
  use Mix.Project

  @url_changelog "https://hexdocs.pm/geolix_testdata/changelog.html"
  @url_github "https://github.com/elixir-geolix/testdata"
  @version "0.6.0-dev"

  def project do
    [
      app: :geolix_testdata,
      name: "Geolix Test Data Provider",
      version: @version,
      elixir: "~> 1.7",
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
      {:castore, "~> 0.1.0"},
      {:credo, "~> 1.0", only: :dev, runtime: false},
      {:dialyxir, "~> 1.0", only: :dev, runtime: false},
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
      plt_file: {:no_warn, "plts/dialyzer.plt"}
    ]
  end

  defp docs do
    [
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
