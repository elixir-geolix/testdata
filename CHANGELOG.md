# Changelog

## v0.5.1 (2020-08-09)

- Bug fixes
    - Warnings from pre-release Elixir `1.11` have been addressed

## v0.5.0 (2020-04-05)

- Enhancements
    - IPv6 addresses are available in `Benchmark.mmdb`
    - IPv6 addresses are available in `Geolix.mmdb`

- Backwards incompatible changes
    - Minimum required Elixir version is now `~> 1.7`

## v0.4.0 (2019-02-27)

- Enhancements
    - Entries to benchmark parsing of specific data types have been extended in `Benchmark.mmdb`
    - Official MaxMind MMDB2 fixtures can be downloaded using `Geolix.TestData.MMDB2Fixture.download/2`. To get the fixture contents and only download if not found locally you can use `Geolix.TestData.MMDB2Fixture.contents/2`

- Backwards incompatible changes
    - Minimum required Elixir version is now `~> 1.5`

## v0.3.0 (2018-07-10)

- Enhancements
    - Entries to benchmark parsing of specific data types have been added to `Benchmark.mmdb`
    - `Geolix.TestData.file/2` is available to use in favor of manually joining the database directory and filename

## v0.2.0 (2018-05-31)

- Enhancements
    - `Benchmark.mmdb` has been added with the intent to be gradually extended with datasets useful to mmdb2 lookup and decoding benchmarks

## v0.1.0 (2018-05-19)

- Initial Release
