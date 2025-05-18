defmodule Storybook.UI do
  @moduledoc false
  use PhoenixStorybook.Index

  def folder_name, do: "Base Components"

  # Component entries
  def entry("button"), do: [name: "Button"]
  def entry("input"), do: [name: "Input"]
  def entry("label"), do: [name: "Label"]
  def entry("card"), do: [name: "Card"]
  def entry("avatar"), do: [name: "Avatar"]
  def entry("textarea"), do: [name: "Textarea"]
  def entry("link"), do: [name: "Link"]
  def entry("tooltip"), do: [name: "Tooltip"]
  def entry("progress"), do: [name: "Progress"]
end
