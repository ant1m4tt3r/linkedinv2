defmodule LinkedinClient.MixProject do
  use Mix.Project

  def project do
    [
      app: :linkedin_client,
      version: "0.1.0",
      elixir: "~> 1.8",
      escript: [main_module: LinkedinClient],
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [{:httpoison, "~> 1.4"}]
  end
end
