defmodule Geolix.TestDataTest do
  use ExUnit.Case

  @files [
    "Geolix.mmdb",
    "Geolix.mmdb.gz",
    "Geolix.mmdb.tar",
    "Geolix.mmdb.tar.gz"
  ]

  test "ensure database files are available" do
    Enum.each(@files, fn file ->
      assert [Application.app_dir(:geolix_testdata, "priv"), "mmdb2", file]
             |> Path.join()
             |> File.exists?()
    end)
  end
end
