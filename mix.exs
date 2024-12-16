defmodule Coherence.Mixfile do
  use Mix.Project

  @version "0.6.0"

  def project do
    [
      app: :coherence,
      version: @version,
      elixir: "~> 1.10",
      elixirc_paths: elixirc_paths(Mix.env()),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      docs: [extras: ["README.md"], main: "Coherence"],
      deps: deps(),
      package: package(),
      dialyzer: [plt_add_apps: [:mix]],
      name: "Coherence",
      description: """
      A full featured, configurable authentication and user management system for Phoenix.
      """
    ]
  end

  def application do
    [
      mod: {Coherence, []},
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_), do: ["lib", "web"]

  defp deps do
    [
      {:ecto_sql, "~> 3.12"},
      {:bcrypt_elixir, "~> 3.2"},
      {:phoenix, "~> 1.7"},
      {:phoenix_html, "~> 4.1"},
      {:phoenix_html_helpers, "~> 1.0"},
      {:gettext, "~> 0.26"},
      {:phoenix_swoosh, "~> 1.2"},
      {:tzdata, "~> 1.1"},
      {:floki, "~> 0.37", only: :test},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:earmark, "~> 1.4", only: :dev},
      {:postgrex, ">= 0.0.0", only: :test},
      {:dialyxir, ">= 0.0.0", only: [:dev], runtime: false},
      {:credo, ">= 0.0.0", only: [:dev, :test]},
      {:plug, "~> 1.16"},
      {:jason, "~> 1.4"}
    ]
  end

  defp package do
    [
      maintainers: ["Stephen Pallen"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/smpallen99/coherence"},
      files: ~w(lib priv README.md mix.exs LICENSE)
    ]
  end
end
