defmodule Geolix.TestData.MMDB2FixtureTest do
  use ExUnit.Case

  alias Geolix.TestData.MMDB2Fixture

  test "ensure download is working" do
    fixture = "MaxMind-DB-test-decoder.mmdb"
    local = Path.join([__DIR__, "../../downloads", fixture])

    assert :ok = MMDB2Fixture.download(fixture, local)
    assert File.exists?(local)
  end
end
