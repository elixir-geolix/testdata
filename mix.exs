defmodule Geolix.TestData.MixProject do
  use Mix.Project

  @url_github "https://github.com/elixir-geolix/testdata"

  def project do
    [
      app: :geolix_testdata,
      name: "Geolix Test Data Provider",
      version: "0.6.0-dev",
      elixir: "~> 1.7",
      deps: [{:ex_doc, ">= 0.0.0", only: :dev, runtime: false}],
      description: "Geolix Test Data Provider",
      docs: docs(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:inets, :ssl]
    ]
  end

  defp docs do
    [
      main: "Geolix.TestData",
      source_ref: "master",
      source_url: @url_github
    ]
  end

  defp package do
    %{
      files: ["CHANGELOG.md", "LICENSE", "mix.exs", "README.md", "lib", "priv"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => @url_github},
      maintainers: ["Marc Neudert"]
    }
  end
end
