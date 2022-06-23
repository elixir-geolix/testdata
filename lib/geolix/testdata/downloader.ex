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

    url = :binary.bin_to_list(remote)
    http_options = [ssl: ssl_options()]

    response = :httpc.request(:get, {url, []}, http_options, [], :geolix_testdata)

    case response do
      {:ok, {{_, 200, _}, _, contents}} -> File.write!(local, contents)
      {:ok, _} -> {:error, :read_failed}
      {:error, _} = error -> error
    end
  after
    :inets.stop(:httpc, :geolix_testdata)
  end

  if Code.ensure_loaded?(:public_key) and
       function_exported?(:public_key, :pkix_verify_hostname_match_fun, 1) do
    defp ssl_options do
      [
        cacertfile: CAStore.file_path(),
        customize_hostname_check: [
          match_fun: :public_key.pkix_verify_hostname_match_fun(:https)
        ],
        verify: :verify_peer
      ]
    end
  else
    defp ssl_options, do: []
  end
end
