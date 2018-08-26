defmodule Geolix.TestData do
  @moduledoc """
  Geolix Test Data Provider
  """

  @type format :: :mmdb2

  @doc """
  Returns the storage directory for a given type.

  There is no check if the format passed is included in the `t:format/0` type.
  """
  @spec dir(format()) :: String.t()
  def dir(format) do
    Path.join([
      Application.app_dir(:geolix_testdata, "priv"),
      to_string(format)
    ])
  end

  @doc """
  Returns the full path to a file.

  No check is performed if the file exists.
  """
  @spec file(format(), String.t()) :: String.t()
  def file(format, filename), do: Path.join([dir(format), filename])

  @doc """
  Returns a list of included files (full path) for a given type.

  If you pass an unknown format not specified by the `t:format/0` type
  an empty list will be returned.
  """
  @spec files(format()) :: [String.t()]
  def files(format) do
    db_dir = dir(format)

    case File.ls(db_dir) do
      {:ok, files} -> Enum.map(files, fn file -> Path.join([db_dir, file]) end)
      {:error, _} -> []
    end
  end
end
