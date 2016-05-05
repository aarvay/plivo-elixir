defmodule Plivo.Mixfile do
  use Mix.Project

  def project do
    [app: :plivo,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     description: description,
     package: package]
  end

  def application do
    [applications: [:logger, :httpoison]]
  end

  defp deps do
    [{:httpoison, "~> 0.8.0"},
     {:poison, "~> 2.0.0"}]
  end

  defp description do
    "An elixir client for Plivo API"
  end

  defp package do
    [name: :plivo,
     maintainers: ["Vignesh Rajagopalan"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/aarvay/plivo-elixir"}]
  end
end
