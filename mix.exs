defmodule Geolix.TestData.MixProject do
  use Mix.Project

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
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
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
      links: %{"GitHub" => @url_github}
    ]
  end
end
