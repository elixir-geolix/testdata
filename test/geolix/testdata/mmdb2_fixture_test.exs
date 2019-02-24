defmodule Geolix.TestData.MMDB2FixtureTest do
  use ExUnit.Case

  alias Geolix.TestData.MMDB2Fixture

  test "ensure download is working" do
    fixture = "MaxMind-DB-test-decoder.mmdb"
    path = Path.join(__DIR__, "../../downloads")
    local = Path.join(path, fixture)

    assert :ok = MMDB2Fixture.download(fixture, path)
    assert File.exists?(local)
  end
end
