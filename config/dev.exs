import Config

config :supabase_ui, Supabase.UI.Web.Endpoint,
  http: [ip: {0, 0, 0, 0}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  reloadable_compilers: [:elixir],
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:supabase_ui, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:supabase_ui, ~w(--watch)]},
    storybook: {Tailwind, :install_and_run, [:storybook, ~w(--watch)]}
  ],
  live_reload: [
    patterns: [
      ~r"storybook/.*(exs)$",
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"lib/supabase/ui/.*(ex|heex)$",
      ~r"storybook/.*(exs)$"
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime

config :phoenix_live_view,
  debug_heex_annotations: true,
  enable_expensive_runtime_checks: true
