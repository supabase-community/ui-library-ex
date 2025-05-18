defmodule Storybook.UI do
  use PhoenixStorybook.Index

  def folder_name, do: "Base Components"
  def folder_icon, do: {:fa, "puzzle-piece", :solid}

  # Component entries
  def entry("button"), do: [name: "Button", icon: {:fa, "square", :solid}]
  def entry("input"), do: [name: "Input", icon: {:fa, "keyboard", :solid}]
  def entry("label"), do: [name: "Label", icon: {:fa, "tag", :solid}]
  def entry("card"), do: [name: "Card", icon: {:fa, "credit-card", :solid}]
  def entry("avatar"), do: [name: "Avatar", icon: {:fa, "user-circle", :solid}]
  def entry("textarea"), do: [name: "Textarea", icon: {:fa, "align-left", :solid}]
  def entry("link"), do: [name: "Link", icon: {:fa, "link", :solid}]
  def entry("tooltip"), do: [name: "Tooltip", icon: {:fa, "message", :solid}]
  def entry("progress"), do: [name: "Progress", icon: {:fa, "gauge", :solid}]
end
