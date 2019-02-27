# Geolix Test Data

Additional files used by tests of the main library and/or adapters.

## Setup

Add the library as a dependency to your `mix.exs` file:

```elixir
defp deps do
  [
    # ...
    {:geolix_testdata, "~> 0.4.0"},
    # ...
  ]
end
```

## Usage

Please look at the inline documentation for more details:

```elixir
iex> Geolix.TestData.dir()
"/path/to/geolix/testdata/priv"

iex> Geolix.TestData.files(:mmdb2)
["/path/to/geolix/testdata/priv/mmdb2/Geolix.mmdb", ...]

iex> fixture = "MaxMind-DB-test-decoder.mmdb"
iex> path = "/storage/path/for/fixture"
iex> Geolix.TestData.MMDB2Fixture.download(fixture, path)
:ok
iex> Geolix.TestData.MMDB2Fixture.contents(fixture, path)
<<0, 0, 1, 0, 1, ...>>
```

## License

[Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0)

License information about the downloadable [MaxMind MMDB2 fixtures](https://github.com/maxmind/MaxMind-DB) can be found at the linked site.
