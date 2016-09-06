defmodule Laboratory.Mixfile do
  use Mix.Project

  def project do
    [app: :laboratory,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: "Cookie based dev feature toggles for Phoenix apps",
     package: package,
     deps: deps()]
  end

  def application do
    [applications: [:plug, :cowboy, :logger]]
  end


  defp deps do
    [
      {:plug, ">= 1.0.0 and < 2.0.0"},
      {:cowboy, "~> 1.0", only: [:dev, :test]},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp package do
    [
      maintainers: ["Emil Soman"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/code-mancers/laboratory"}
    ]
  end
end
