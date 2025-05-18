defmodule Storybook.UI.Link do
  use PhoenixStorybook.Story, :component

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
      %PhoenixStorybook.Stories.Attr{
        id: :href,
        type: :string,
        doc: "URL to link to",
        required: true
      },
      %PhoenixStorybook.Stories.Attr{
        id: :class,
        type: :string,
        doc: "Additional CSS classes"
      },
      %PhoenixStorybook.Stories.Attr{
        id: :variant,
        type: :string,
        doc: "Link style variant",
        values: ~w(default secondary destructive ghost),
        default: "default"
      },
      %PhoenixStorybook.Stories.Attr{
        id: :target,
        type: :string,
        doc: "Link target attribute",
        values: ["_blank", "_self", "_parent", "_top"]
      },
      %PhoenixStorybook.Stories.Attr{
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
      %PhoenixStorybook.Stories.Variation{
        id: :default,
        description: "Default link",
        attributes: %{
          href: "#"
        },
        slots: ["Link to page"]
      },
      %PhoenixStorybook.Stories.Variation{
        id: :secondary,
        description: "Secondary link",
        attributes: %{
          href: "#",
          variant: "secondary"
        },
        slots: ["Secondary link"]
      },
      %PhoenixStorybook.Stories.Variation{
        id: :destructive,
        description: "Destructive link",
        attributes: %{
          href: "#",
          variant: "destructive"
        },
        slots: ["Destructive link"]
      },
      %PhoenixStorybook.Stories.Variation{
        id: :ghost,
        description: "Ghost link",
        attributes: %{
          href: "#",
          variant: "ghost"
        },
        slots: ["Ghost link"]
      },
      %PhoenixStorybook.Stories.Variation{
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
          %PhoenixStorybook.Stories.Variation{
            id: :link_home,
            attributes: %{href: "#", variant: "default"},
            slots: ["Home"]
          },
          %PhoenixStorybook.Stories.Variation{
            id: :link_products,
            attributes: %{href: "#", variant: "secondary"},
            slots: ["Products"]
          },
          %PhoenixStorybook.Stories.Variation{
            id: :link_blog,
            attributes: %{href: "#", variant: "ghost"},
            slots: ["Blog"]
          },
          %PhoenixStorybook.Stories.Variation{
            id: :link_about,
            attributes: %{href: "#", variant: "default"},
            slots: ["About"]
          },
          %PhoenixStorybook.Stories.Variation{
            id: :link_contact,
            attributes: %{href: "#", variant: "destructive"},
            slots: ["Contact"]
          }
        ]
      }
    ]
  end
end
