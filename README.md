# Geolix Test Data

Additional files used by tests of the main library and/or adapters.

## Setup

Add the library as a dependency to your `mix.exs` file:

```elixir
defp deps do
  [
    # ...
    {:geolix_testdata, "~> 0.3.0"},
    # ...
  ]
end
```

## Usage

Please look at the `Geolix.TestData` inline documentation for more details:

```elixir
iex> Geolix.TestData.dir()
"/path/to/geolix/testdata/priv"

iex> Geolix.TestData.files(:mmdb2)
["/path/to/geolix/testdata/priv/mmdb2/Geolix.mmdb", ...]
```

## License

[Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0)
