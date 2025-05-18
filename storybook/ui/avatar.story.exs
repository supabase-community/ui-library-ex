defmodule Storybook.UI.Avatar do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias PhoenixStorybook.Stories.Variation
  alias PhoenixStorybook.Stories.VariationGroup

  def function, do: &Supabase.UI.avatar/1
  def imports, do: [{Supabase.UI, []}]

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
      %Variation{
        id: :with_image,
        description: "Avatar with image",
        slots: [
          """
          <.avatar_image src="https://github.com/shadcn.png" alt="User" />
          <.avatar_fallback>JD</.avatar_fallback>
          """
        ]
      },
      %Variation{
        id: :with_fallback,
        description: "Avatar with fallback (no image)",
        slots: [
          """
          <.avatar_fallback>JD</.avatar_fallback>
          """
        ]
      },
      %Variation{
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
      %VariationGroup{
        id: :avatar_parts,
        description: "Individual avatar components",
        variations: [
          %Variation{
            id: :avatar_image,
            description: "Avatar image",
            attributes: %{
              src: "https://github.com/shadcn.png",
              alt: "User"
            }
          },
          %Variation{
            id: :avatar_fallback,
            description: "Avatar fallback",
            slots: ["JD"]
          }
        ]
      },
      %VariationGroup{
        id: :avatar_group,
        description: "Avatar group example",
        template: """
        <div class="flex -space-x-2">
          <.psb-variation-group />
        </div>
        """,
        variations: [
          %Variation{
            id: :avatar1,
            attributes: %{class: "ring-2 ring-background"},
            slots: [
              """
              <.avatar_image src="https://github.com/shadcn.png" alt="User 1" />
              """
            ]
          },
          %Variation{
            id: :avatar2,
            attributes: %{class: "ring-2 ring-background"},
            slots: [
              """
              <.avatar_image src="https://github.com/colinhacks.png" alt="User 2" />
              """
            ]
          },
          %Variation{
            id: :avatar3,
            attributes: %{class: "ring-2 ring-background"},
            slots: [
              """
              <.avatar_fallback>JD</.avatar_fallback>
              """
            ]
          },
          %Variation{
            id: :avatar4,
            attributes: %{class: "ring-2 ring-background"},
            slots: [
              """
              <.avatar_fallback>MS</.avatar_fallback>
              """
            ]
          },
          %Variation{
            id: :more_avatar,
            attributes: %{
              class: "ring-2 ring-background flex items-center justify-center bg-muted text-muted-foreground"
            },
            slots: ["+2"]
          }
        ]
      }
    ]
  end
end
