defmodule Supabase.UI.Web.Endpoint do
  use Phoenix.Endpoint, otp_app: :supabase_ui

  alias Supabase.UI

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  @session_options [
    store: :cookie,
    key: "_supabase_ui_key",
    signing_salt: "7ZI1IH1h"
  ]

  socket "/socket", UI.Web.UserSocket, websocket: true, longpoll: false
  socket "/live", Phoenix.LiveView.Socket, websocket: [connect_info: [session: @session_options]]

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phx.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/",
    from: :supabase_ui,
    gzip: true,
    only: UI.Web.static_paths()

  plug Plug.RequestId

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.Session, @session_options

  plug UI.Web.Router
end
