defmodule Storybook.UI.Tooltip do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias PhoenixStorybook.Stories.Attr
  alias PhoenixStorybook.Stories.Variation

  def function, do: &Supabase.UI.tooltip/1
  def imports, do: [{Supabase.UI, []}]

  def doc do
    """
    A tooltip component for displaying additional information.

    Tooltips provide contextual information when hovering over an element.
    """
  end

  def attributes do
    [
      %Attr{
        id: :text,
        type: :string,
        doc: "Text to display in the tooltip",
        required: true
      },
      %Attr{
        id: :class,
        type: :string,
        doc: "Additional CSS classes for the tooltip"
      }
    ]
  end

  def slots do
    [
      %PhoenixStorybook.Stories.Slot{
        id: :inner_block,
        doc: "Element that triggers the tooltip",
        required: true
      }
    ]
  end

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default tooltip",
        attributes: %{
          text: "Tooltip information"
        },
        slots: [
          """
          <.button>Hover me</.button>
          """
        ]
      },
      %Variation{
        id: :icon_tooltip,
        description: "Tooltip on an icon",
        attributes: %{
          text: "More information"
        },
        slots: [
          """
          <.button variant="ghost" size="icon">ℹ️</.button>
          """
        ]
      },
      %Variation{
        id: :custom_tooltip,
        description: "Tooltip with custom styling",
        attributes: %{
          text: "Custom styled tooltip",
          class: "bg-primary text-primary-foreground"
        },
        slots: [
          """
          <.button variant="outline">Custom Tooltip</.button>
          """
        ]
      }
    ]
  end

  def variation_groups do
    [
      %PhoenixStorybook.Stories.VariationGroup{
        id: :tooltip_group,
        description: "Tooltips in a group",
        template: """
        <div class="flex space-x-4 items-center">
          <.psb-variation-group />
        </div>
        """,
        variations: [
          %Variation{
            id: :edit_tooltip,
            attributes: %{text: "Edit"},
            slots: [
              """
              <.button variant="ghost" size="icon">✏️</.button>
              """
            ]
          },
          %Variation{
            id: :delete_tooltip,
            attributes: %{text: "Delete"},
            slots: [
              """
              <.button variant="ghost" size="icon">🗑️</.button>
              """
            ]
          },
          %Variation{
            id: :share_tooltip,
            attributes: %{text: "Share"},
            slots: [
              """
              <.button variant="ghost" size="icon">📤</.button>
              """
            ]
          }
        ]
      }
    ]
  end
end
