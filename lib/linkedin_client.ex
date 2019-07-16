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

    read()
  end

  def read do
    IO.gets("> ") 
    |> String.replace("\n", "")     
    |> String.trim
    |> run_command
  end


  def run_command("exit") do
    IO.puts "bye!"
  end

  def run_command("help") do
    IO.puts "Let me help you with that!"
    IO.puts "Why don't you try make a simple get request to the 'bananas' endpoint?'"
    IO.puts "Try runing: 'GET /bananas'"
    read()
  end

  def run_command(input) do
    loop(input)
  end

  def loop(input) do
    case request(input) do
      {:ok, %{body: raw_body, status_code: code}} ->
        IO.puts "Status: #{to_string(code)}\nResponse Body: #{raw_body}"
      {:error, _} -> IO.puts "Error"
    end
    read()
  end

  def request(req) do
    case parseRequest(req) do
      {:get, endpoint} -> HTTPoison.get(@api_url <> "#{endpoint}")
    end
  end

  def parseRequest(req) do
    [reqType, params] = String.split(req, " ")
    case String.downcase reqType do
      "get" -> {:get, params}
    end
  end
end
