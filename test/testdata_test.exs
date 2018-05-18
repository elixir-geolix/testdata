defmodule Geolix.TestDataTest do
  use ExUnit.Case

  alias Geolix.TestData

  test "ensure :mmdb2 files are available" do
    Enum.each(TestData.files(:mmdb2), &File.exists?/1)
  end
end
