import Config

if System.get_env("PHX_SERVER") do
  config :supabase_ui, Supabase.UI.Web.Endpoint, server: true
end

if config_env() == :prod do
  secret_key_base =
    System.get_env("SECRET_KEY_BASE") ||
      raise "SECRET_KEY_BASE not available"

  config :supabase_ui, Supabase.UI.Web.Endpoint,
    secret_key_base: secret_key_base,
    url: [host: "example.com"],
    http: [
      ip: {0, 0, 0, 0, 0, 0, 0, 0},
      port: String.to_integer(System.get_env("PORT") || "4000")
    ]
end
