defmodule Supabase.UI.Web.Router do
  use Supabase.UI.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {Supabase.UI.Web.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", Supabase.UI.Web do
    pipe_through(:browser)

    live "/", ComponentsPreviewLive, :index
  end
end
