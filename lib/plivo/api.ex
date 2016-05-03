defmodule Plivo.API do
  use HTTPoison.Base

  @version "v1"
  @base_url "https://api.plivo.com/#{@version}"

  def call(method, endpoint \\ "/", body \\ "") do
    __MODULE__.request!(method, endpoint, body,
      ["User-Agent": "ElixirPlivo", "Content-Type": "application/json"],
      [hackney: [basic_auth: {auth_id, auth_token}]]
    )
  end

  defp process_url(url) do
    @base_url <> "/Account/" <> auth_id <> url
  end

  defp process_request_body(body) when is_binary(body) do
    body
  end

  defp process_request_body(body) do
    body
    |> Enum.into(%{})
    |> Poison.encode!
  end

  def process_response_body(body) do
    body
    |> Poison.Parser.parse!(keys: :atoms)
  end

  defp auth_id do
    Application.get_env(:plivo, :auth_id) ||
      System.get_env("PLIVO_AUTH_ID")
  end

  defp auth_token do
    Application.get_env(:plivo, :auth_token) ||
      System.get_env("PLIVO_AUTH_TOKEN")
  end
end
