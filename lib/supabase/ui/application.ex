defmodule Supabase.UI.Application do
  @moduledoc false
  use Application

  alias Supabase.UI.Web.Endpoint

  @impl true
  def start(_, _) do
    opts = [strategy: :one_for_one, name: Supabase.UI.Supervisor]
    Supervisor.start_link(children(), opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Endpoint.config_change(changed, removed)
    :ok
  end

  def children do
    [
      {Phoenix.PubSub, name: Supabase.UI.PubSub},
      Endpoint
    ]
  end
end
