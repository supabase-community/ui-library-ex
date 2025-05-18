defmodule Storybook.UI.Button do
  use PhoenixStorybook.Story, :component

  def function, do: &Supabase.UI.button/1
  # Do not import Supabase.UI directly to avoid function name conflicts
  def imports, do: []

  def doc do
    """
    A button component for user interactions.

    Buttons allow users to perform actions with a single click or tap.
    """
  end

  def attributes do
    [
      %PhoenixStorybook.Stories.Attr{
        id: :variant,
        type: :string,
        doc: "Button style variant",
        values: ~w(default destructive outline secondary ghost link),
        default: "default"
      },
      %PhoenixStorybook.Stories.Attr{
        id: :size,
        type: :string,
        doc: "Button size",
        values: ~w(default sm lg icon),
        default: "default"
      },
      %PhoenixStorybook.Stories.Attr{
        id: :type,
        type: :string,
        doc: "HTML button type attribute",
        values: ~w(button submit reset),
        default: "button"
      },
      %PhoenixStorybook.Stories.Attr{
        id: :disabled,
        type: :boolean,
        doc: "Whether the button is disabled",
        default: false
      },
      %PhoenixStorybook.Stories.Attr{
        id: :class,
        type: :string,
        doc: "Additional CSS classes"
      }
    ]
  end

  def slots do
    [
      %PhoenixStorybook.Stories.Slot{
        id: :inner_block,
        doc: "Button content",
        required: true
      }
    ]
  end

  def variations do
    [
      %PhoenixStorybook.Stories.Variation{
        id: :default,
        description: "Default button",
        slots: ["Button"]
      },
      %PhoenixStorybook.Stories.Variation{
        id: :destructive,
        description: "Destructive action button",
        attributes: %{variant: "destructive"},
        slots: ["Delete"]
      },
      %PhoenixStorybook.Stories.Variation{
        id: :outline,
        description: "Outline button",
        attributes: %{variant: "outline"},
        slots: ["Outline"]
      },
      %PhoenixStorybook.Stories.Variation{
        id: :secondary,
        description: "Secondary button",
        attributes: %{variant: "secondary"},
        slots: ["Secondary"]
      },
      %PhoenixStorybook.Stories.Variation{
        id: :ghost,
        description: "Ghost button",
        attributes: %{variant: "ghost"},
        slots: ["Ghost"]
      },
      %PhoenixStorybook.Stories.Variation{
        id: :link,
        description: "Link button",
        attributes: %{variant: "link"},
        slots: ["Link"]
      },
      %PhoenixStorybook.Stories.Variation{
        id: :disabled,
        description: "Disabled button",
        attributes: %{disabled: true},
        slots: ["Disabled"]
      }
    ]
  end

  def variation_groups do
    [
      %PhoenixStorybook.Stories.VariationGroup{
        id: :sizes,
        description: "Button sizes",
        variations: [
          %PhoenixStorybook.Stories.Variation{
            id: :small,
            description: "Small button",
            attributes: %{size: "sm"},
            slots: ["Small"]
          },
          %PhoenixStorybook.Stories.Variation{
            id: :default_size,
            description: "Default button size",
            slots: ["Default"]
          },
          %PhoenixStorybook.Stories.Variation{
            id: :large,
            description: "Large button",
            attributes: %{size: "lg"},
            slots: ["Large"]
          }
        ]
      },
      %PhoenixStorybook.Stories.VariationGroup{
        id: :icon_buttons,
        description: "Icon buttons",
        template: """
        <div class="flex items-center space-x-4">
          <.psb-variation-group />
        </div>
        """,
        variations: [
          %PhoenixStorybook.Stories.Variation{
            id: :icon_default,
            description: "Default icon button",
            attributes: %{size: "icon"},
            slots: ["👍"]
          },
          %PhoenixStorybook.Stories.Variation{
            id: :icon_ghost,
            description: "Ghost icon button",
            attributes: %{size: "icon", variant: "ghost"},
            slots: ["⭐"]
          },
          %PhoenixStorybook.Stories.Variation{
            id: :icon_outline,
            description: "Outline icon button",
            attributes: %{size: "icon", variant: "outline"},
            slots: ["❤️"]
          }
        ]
      }
    ]
  end
end
