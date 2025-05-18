defmodule Storybook.Root do
  # See https://hexdocs.pm/phoenix_storybook/PhoenixStorybook.Index.html for full index
  # documentation.
  @moduledoc false
  use PhoenixStorybook.Index

  def folder_icon, do: {:fa, "book-open", :solid, "psb-mr-1"}
  def folder_name, do: "Supabase UI"

  def entry("welcome") do
    [
      name: "Welcome Page",
      icon: {:fa, "hand-wave", :solid}
    ]
  end

  def entry("ui") do
    [
      name: "Base Components",
      icon: {:fa, "puzzle-piece", :solid}
    ]
  end

  def entry("auth") do
    [
      name: "Auth Components",
      icon: {:fa, "lock", :solid}
    ]
  end

  def entry("storage") do
    [
      name: "Storage Components",
      icon: {:fa, "cloud-upload", :solid}
    ]
  end

  def entry("realtime") do
    [
      name: "Realtime Components",
      icon: {:fa, "bolt", :solid}
    ]
  end
end
