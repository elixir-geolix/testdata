defmodule Geolix.TestData.Mixfile do
  use Mix.Project

  @url_github "https://github.com/elixir-geolix/testdata"

  def project do
    [
      app: :geolix_testdata,
      name: "Geolix Test Data Provider",
      version: "0.3.0",
      elixir: "~> 1.3",
      deps: [{:ex_doc, ">= 0.0.0", only: :dev, runtime: false}],
      description: "Geolix Test Data Provider",
      docs: docs(),
      package: package()
    ]
  end

  defp docs do
    [
      main: "Geolix.TestData",
      source_ref: "v0.3.0",
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
