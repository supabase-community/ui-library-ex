defmodule Supabase.UI.MixProject do
  use Mix.Project

  @version "0.1.0"
  @source_url "https://github.com/supabase-community/ui-library-ex"

  def project do
    [
      app: :supabase_ui,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      package: package(),
      description: description(),
      aliases: aliases(),
      dialyzer: [plt_local_path: "priv/plts", ignore_warnings: ".dialyzerignore.exs"]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Supabase.UI.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:supabase_potion, "~> 0.6"},
      {:bandit, "~> 1.6"},
      {:jason, "~> 1.2"},
      {:phoenix, "~> 1.7"},
      {:phoenix_live_view, "~> 1.0"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:esbuild, "~> 0.9", runtime: Mix.env() == :dev},
      {:tailwind, "~> 0.3", runtime: Mix.env() == :dev},
      {:ex_doc, ">= 0.0.0", only: [:dev], runtime: false},
      {:styler, "~> 1.4", only: [:dev, :test], runtime: false},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.3", only: [:dev, :test], runtime: false}
    ]
  end

  defp aliases do
    [
      setup: ["deps.get", "assets.setup", "assets.build"],
      "assets.setup": ["tailwind.install --if-missing", "esbuild.install --if-missing"],
      "assets.build": ["tailwind supabase_ui", "esbuild supabase_ui"],
      "assets.deploy": [
        "tailwind supabase_ui --minify",
        "esbuild supabase_ui --minify",
        "phx.digest"
      ]
    ]
  end

  defp package do
    %{
      licenses: ["MIT"],
      contributors: ["zoedsoupe"],
      links: %{
        "GitHub" => @source_url,
        "Docs" => "https://hexdocs.pm/supabase_ui"
      },
      files:
        ~w[lib mix.exs priv/static/assets/js/hooks.js priv/static/assets/supabase-ui.css README.md LICENSE CHANGELOG.md]
    }
  end

  defp docs do
    [
      main: "Supabase.UI",
      extras: [
        "README.md",
        "CHANGELOG.md"
      ],
      source_url: @source_url,
      source_ref: "v#{@version}",
      formatters: ["html"]
    ]
  end

  defp description do
    """
    Implementation of Supabase UI for Phoenix Live View
    """
  end
end
