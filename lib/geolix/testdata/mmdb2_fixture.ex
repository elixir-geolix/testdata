defmodule Geolix.TestData.MMDB2Fixture do
  @moduledoc """
  MMDB2 Fixture Provider (Downloader)
  """

  alias Geolix.TestData.Downloader

  @upstream_base "https://raw.githubusercontent.com/maxmind/MaxMind-DB/master/test-data/"

  @doc """
  Downloads a test fixture from the MaxMind MMDB2 specification repository.

  ## Usage

      iex> download("MaxMind-DB-test-decoder.mmdb", "/full/path/to/local/MaxMind-DB-test-decoder.mmdb")
      :ok
  """
  @spec download(String.t(), Path.t()) :: :ok | {:error, term}
  def download(fixture, local) do
    Downloader.download(@upstream_base <> fixture, local)
  end
end
