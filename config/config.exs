import Config

config :tailwind,
  version: "4.0.9",
  supabase_ui: [
    args: ~w(
      --input=assets/css/supabase-ui.css
      --output=priv/static/assets/supabase-ui.css
    ),
    cd: Path.expand("..", __DIR__)
  ],
  storybook: [
    args: ~w(
          --config=tailwind.config.js
          --input=assets/css/storybook.css
          --output=priv/static/assets/storybook.css
        ),
    cd: Path.expand("..", __DIR__)
  ]

config :esbuild,
  version: "0.25.0",
  supabase_ui: [
    args:
      ~w(js/hooks.js js/storybook.js --bundle --target=es2022 --outdir=../priv/static/assets/js --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :supabase_ui, Supabase.UI.Web.Endpoint,
  adapter: Bandit.PhoenixAdapter,
  secret_key_base: "yFgelUyKSgiemxYRsbxwGxiQKROQTx0bokxUGNZOnOOqJExsqZSsUHmcq4Ue11Tx",
  pubsub_server: Supabase.UI.PubSub,
  render_errors: [formats: [html: Supabase.UI.Web.ErrorHTML], layout: false],
  live_view: [signing_salt: "TxTzLCT/WGlob2+Vo0uZ1IQAfkgq53M"],
  server: true

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{config_env()}.exs"
