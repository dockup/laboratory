defmodule Laboratory.Mixfile do
  use Mix.Project

  def project do
    [app: :laboratory,
     version: "0.0.1",
     elixir: "~> 1.2",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix | Mix.compilers],
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: "Cookie based dev feature toggles for Phoenix apps",
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {Laboratory, []},
     applications: [:phoenix, :phoenix_html, :cowboy, :logger]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:phoenix, ">= 1.0.0 and < 2.0.0"},
     {:phoenix_html, "~> 2.6"},
     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:cowboy, "~> 1.0", only: :dev}]
  end

  defp package do
    [
      maintainers: ["Emil Soman"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/code-mancers/laboratory"}
    ]
  end
end
