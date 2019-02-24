defmodule Geolix.TestData.MMDB2Fixture do
  @moduledoc """
  MMDB2 Fixture Provider (Downloader)
  """

  alias Geolix.TestData.Downloader

  @upstream_base "https://raw.githubusercontent.com/maxmind/MaxMind-DB/master/test-data/"

  @doc """
  Returns the contents of a test fixture.

  If the fixture is not found in the given path a download will be done to make
  it available.
  """
  @spec contents(String.t(), Path.t()) :: binary
  def contents(fixture, path) do
    local = Path.join(path, fixture)

    if not File.regular?(local) do
      :ok = download(fixture, path)
    end

    File.read!(local)
  end

  @doc """
  Downloads a test fixture from the MaxMind MMDB2 specification repository.

  ## Usage

      iex> download("MaxMind-DB-test-decoder.mmdb", "/storage/path/for/fixture")
      :ok
  """
  @spec download(String.t(), Path.t()) :: :ok | {:error, term}
  def download(fixture, path) do
    remote = @upstream_base <> fixture
    local = Path.join(path, fixture)

    Downloader.download(remote, local)
  end
end
