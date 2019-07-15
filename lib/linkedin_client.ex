defmodule LinkedinClient do
  @moduledoc """
  Documentation for LinkedinClient.
  """

  @doc """
  Simple LinkedInAPI v2 REPL Client
  """

  @api_url "https://api.linkedin.com/v2"

  def main(_ \\ []) do
    IO.puts "LinkedInAPI v2 REPL Client\nCreated by: augustohdias"

    case read() do
      {:repeat, input} -> loop(input)
      {:exit, _} -> IO.puts "bye!"
    end
  end

  def loop(input) do
    case request(input) do
      {:ok, %{body: raw_body, status_code: code}} ->
        IO.puts "Status: #{to_string(code)}\nResponse Body: #{raw_body}"
      {:error, _} -> IO.puts "Error"
    end
    read()
  end

  def read do
    str = IO.gets("> ") |> String.replace("\n", "")
    if str == "exit", do: {:exit, str}, else: {:repeat, str}
  end

  def request(req) do
    case parseRequest(req) do
      {:get, endpoint} -> HTTPoison.get(@api_url <> "#{endpoint}")
    end
  end

  def parseRequest(req) do
    [reqType, params] = String.split(req, " ")
    case reqType do
      "GET" -> {:get, params}
    end
  end
end
