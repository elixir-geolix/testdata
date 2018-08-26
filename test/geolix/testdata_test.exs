defmodule Geolix.TestDataTest do
  use ExUnit.Case

  alias Geolix.TestData

  test "ensure :mmdb2 files are available" do
    Enum.each(TestData.files(:mmdb2), fn file ->
      assert File.exists?(file)
      assert file == TestData.file(:mmdb2, Path.basename(file))
    end)
  end
end
