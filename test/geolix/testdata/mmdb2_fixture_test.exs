defmodule Geolix.TestData.MMDB2FixtureTest do
  use ExUnit.Case

  alias Geolix.TestData.MMDB2Fixture

  test "ensure download is working" do
    fixture = "GeoIP2-Connection-Type-Test.mmdb"
    path = Path.join(__DIR__, "../../downloads")
    local = Path.join(path, fixture)

    assert :ok = MMDB2Fixture.download(fixture, path, "a8ae5b4ac0aa730e2783f708cdaa208aca20e9ec")
    assert File.exists?(local)
    assert 4413 == File.stat!(local).size

    assert :ok = MMDB2Fixture.download(fixture, path, "f17411f348e82ab050c3a19fbee1ed09ebb5737a")
    assert File.exists?(local)
    assert 4423 == File.stat!(local).size
  end
end
