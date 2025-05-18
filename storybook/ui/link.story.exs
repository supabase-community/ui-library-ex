defmodule Storybook.UI.Link do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias PhoenixStorybook.Stories.Attr
  alias PhoenixStorybook.Stories.Variation

  def function, do: &Supabase.UI.link/1
  # Do not import Supabase.UI directly to avoid function name conflicts
  def imports, do: []

  def doc do
    """
    A link component for navigation.

    Links allow users to navigate to other pages or sections of the application.
    """
  end

  def attributes do
    [
      %Attr{
        id: :href,
        type: :string,
        doc: "URL to link to",
        required: true
      },
      %Attr{
        id: :class,
        type: :string,
        doc: "Additional CSS classes"
      },
      %Attr{
        id: :variant,
        type: :string,
        doc: "Link style variant",
        values: ~w(default secondary destructive ghost),
        default: "default"
      },
      %Attr{
        id: :target,
        type: :string,
        doc: "Link target attribute",
        values: ["_blank", "_self", "_parent", "_top"]
      },
      %Attr{
        id: :rel,
        type: :string,
        doc: "Link relationship attribute"
      }
    ]
  end

  def slots do
    [
      %PhoenixStorybook.Stories.Slot{
        id: :inner_block,
        doc: "Link content",
        required: true
      }
    ]
  end

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default link",
        attributes: %{
          href: "#"
        },
        slots: ["Link to page"]
      },
      %Variation{
        id: :secondary,
        description: "Secondary link",
        attributes: %{
          href: "#",
          variant: "secondary"
        },
        slots: ["Secondary link"]
      },
      %Variation{
        id: :destructive,
        description: "Destructive link",
        attributes: %{
          href: "#",
          variant: "destructive"
        },
        slots: ["Destructive link"]
      },
      %Variation{
        id: :ghost,
        description: "Ghost link",
        attributes: %{
          href: "#",
          variant: "ghost"
        },
        slots: ["Ghost link"]
      },
      %Variation{
        id: :external_link,
        description: "External link",
        attributes: %{
          href: "https://supabase.com",
          target: "_blank",
          rel: "noopener noreferrer"
        },
        slots: ["Visit Supabase"]
      }
    ]
  end

  def variation_groups do
    [
      %PhoenixStorybook.Stories.VariationGroup{
        id: :link_row,
        description: "Links displayed in a row",
        template: """
        <div class="flex flex-wrap gap-4">
          <.psb-variation-group/>
        </div>
        """,
        variations: [
          %Variation{
            id: :link_home,
            attributes: %{href: "#", variant: "default"},
            slots: ["Home"]
          },
          %Variation{
            id: :link_products,
            attributes: %{href: "#", variant: "secondary"},
            slots: ["Products"]
          },
          %Variation{
            id: :link_blog,
            attributes: %{href: "#", variant: "ghost"},
            slots: ["Blog"]
          },
          %Variation{
            id: :link_about,
            attributes: %{href: "#", variant: "default"},
            slots: ["About"]
          },
          %Variation{
            id: :link_contact,
            attributes: %{href: "#", variant: "destructive"},
            slots: ["Contact"]
          }
        ]
      }
    ]
  end
end
