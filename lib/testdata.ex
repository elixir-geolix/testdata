defmodule Geolix.TestData do
  @moduledoc """
  Geolix Test Data Provider
  """

  @type format :: :mmdb2

  @doc """
  Returns a list of included files (full path) for a given type.

  If you pass an unknown format not specified by `__MODULE__.format()`
  an empty list will be returned.
  """
  @spec files(format()) :: [String.t()]
  def files(format) do
    priv_dir = Application.app_dir(:geolix_testdata, "priv")
    db_dir = Path.join([priv_dir, to_string(format)])

    case File.ls(db_dir) do
      {:ok, files} -> Enum.map(files, fn file -> Path.join([db_dir, file]) end)
      {:error, _} -> []
    end
  end
end
