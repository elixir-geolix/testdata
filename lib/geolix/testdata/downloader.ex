defmodule Geolix.TestData.Downloader do
  @moduledoc false

  @doc """
  Downloads a file and stores it locally.
  """
  @spec download(String.t(), String.t()) :: :ok | {:error, term}
  def download(remote, local) do
    {:ok, _} = Application.ensure_all_started(:ssl)
    {:ok, _} = Application.ensure_all_started(:inets)

    {:ok, _pid} = :inets.start(:httpc, profile: :geolix_testdata)

    remote
    |> :binary.bin_to_list()
    |> :httpc.request(:geolix_testdata)
    |> case do
      {:ok, {{_, 200, _}, _, contents}} -> File.write!(local, contents, [:utf8])
      {:ok, _} -> {:error, :read_failed}
      {:error, _} = error -> error
    end
  after
    :inets.stop(:httpc, :geolix_testdata)
  end
end
