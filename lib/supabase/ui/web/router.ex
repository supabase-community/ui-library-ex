defmodule Supabase.UI.Web.Router do
  use Supabase.UI.Web, :router

  import PhoenixStorybook.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {Supabase.UI.Web.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/" do
    storybook_assets()
  end

  scope "/", Supabase.UI.Web do
    pipe_through(:browser)
    live_storybook("/storybook", backend_module: Supabase.UI.Web.Storybook)
  end
end
