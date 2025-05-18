defmodule Storybook.UI.Avatar do
  use PhoenixStorybook.Story, :component

  def function, do: &Supabase.UI.avatar/1
  def imports, do: [{Supabase.UI, []}]

  def doc do
    """
    An avatar component for user profile pictures.

    Avatars represent users in the interface, typically displaying a profile picture or initials.
    """
  end

  def attributes do
    [
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
        doc: "Avatar content (usually avatar_image or avatar_fallback)",
        required: true
      }
    ]
  end

  def variations do
    [
      %PhoenixStorybook.Stories.Variation{
        id: :with_image,
        description: "Avatar with image",
        slots: [
          """
          <.avatar_image src="https://github.com/shadcn.png" alt="User" />
          <.avatar_fallback>JD</.avatar_fallback>
          """
        ]
      },
      %PhoenixStorybook.Stories.Variation{
        id: :with_fallback,
        description: "Avatar with fallback (no image)",
        slots: [
          """
          <.avatar_fallback>JD</.avatar_fallback>
          """
        ]
      },
      %PhoenixStorybook.Stories.Variation{
        id: :custom_size,
        description: "Avatar with custom size",
        attributes: %{
          class: "h-16 w-16"
        },
        slots: [
          """
          <.avatar_image src="https://github.com/shadcn.png" alt="User" />
          <.avatar_fallback>JD</.avatar_fallback>
          """
        ]
      }
    ]
  end

  def variation_groups do
    [
      %PhoenixStorybook.Stories.VariationGroup{
        id: :avatar_parts,
        description: "Individual avatar components",
        variations: [
          %PhoenixStorybook.Stories.Variation{
            id: :avatar_image,
            description: "Avatar image",
            function: &Supabase.UI.avatar_image/1,
            attributes: %{
              src: "https://github.com/shadcn.png",
              alt: "User"
            }
          },
          %PhoenixStorybook.Stories.Variation{
            id: :avatar_fallback,
            description: "Avatar fallback",
            function: &Supabase.UI.avatar_fallback/1,
            slots: ["JD"]
          }
        ]
      },
      %PhoenixStorybook.Stories.VariationGroup{
        id: :avatar_group,
        description: "Avatar group example",
        template: """
        <div class="flex -space-x-2">
          <.psb-variation-group />
        </div>
        """,
        variations: [
          %PhoenixStorybook.Stories.Variation{
            id: :avatar1,
            attributes: %{class: "ring-2 ring-background"},
            slots: [
              """
              <.avatar_image src="https://github.com/shadcn.png" alt="User 1" />
              """
            ]
          },
          %PhoenixStorybook.Stories.Variation{
            id: :avatar2,
            attributes: %{class: "ring-2 ring-background"},
            slots: [
              """
              <.avatar_image src="https://github.com/colinhacks.png" alt="User 2" />
              """
            ]
          },
          %PhoenixStorybook.Stories.Variation{
            id: :avatar3,
            attributes: %{class: "ring-2 ring-background"},
            slots: [
              """
              <.avatar_fallback>JD</.avatar_fallback>
              """
            ]
          },
          %PhoenixStorybook.Stories.Variation{
            id: :avatar4,
            attributes: %{class: "ring-2 ring-background"},
            slots: [
              """
              <.avatar_fallback>MS</.avatar_fallback>
              """
            ]
          },
          %PhoenixStorybook.Stories.Variation{
            id: :more_avatar,
            attributes: %{
              class:
                "ring-2 ring-background flex items-center justify-center bg-muted text-muted-foreground"
            },
            slots: ["+2"]
          }
        ]
      }
    ]
  end
end
