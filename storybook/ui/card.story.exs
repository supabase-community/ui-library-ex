defmodule Storybook.UI.Card do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias PhoenixStorybook.Stories.Variation
  alias PhoenixStorybook.Stories.VariationGroup

  def function, do: &Supabase.UI.card/1
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
        doc: "Card content",
        required: true
      }
    ]
  end

  def variations do
    [
      %Variation{
        id: :basic,
        description: "Basic card",
        slots: [
          """
          <div class="p-6">
            Basic card content
          </div>
          """
        ]
      },
      %Variation{
        id: :with_custom_class,
        description: "Card with custom styling",
        attributes: %{
          class: "max-w-md mx-auto"
        },
        slots: [
          """
          <div class="p-6">
            Card with custom styling
          </div>
          """
        ]
      }
    ]
  end

  def variation_groups do
    [
      %VariationGroup{
        id: :complete_card,
        description: "Complete card with all sections",
        variations: [
          %Variation{
            id: :profile_card,
            description: "Profile card example",
            attributes: %{class: "max-w-md"},
            slots: [
              """
              <Supabase.UI.card_header>
                <Supabase.UI.card_title>Account Settings</Supabase.UI.card_title>
                <Supabase.UI.card_description>Manage your account information and preferences.</Supabase.UI.card_description>
              </Supabase.UI.card_header>
              <Supabase.UI.card_content>
                <div class="space-y-4">
                  <div class="space-y-1">
                    <Supabase.UI.label for="name">Name</Supabase.UI.label>
                    <Supabase.UI.input id="name" value="John Doe" />
                  </div>
                  <div class="space-y-1">
                    <Supabase.UI.label for="email">Email</Supabase.UI.label>
                    <Supabase.UI.input id="email" type="email" value="john@example.com" />
                  </div>
                </div>
              </Supabase.UI.card_content>
              <Supabase.UI.card_footer>
                <Supabase.UI.button>Save Changes</Supabase.UI.button>
              </Supabase.UI.card_footer>
              """
            ]
          },
          %Variation{
            id: :notification_card,
            description: "Notification card example",
            attributes: %{class: "max-w-md"},
            slots: [
              """
              <Supabase.UI.card_header>
                <Supabase.UI.card_title>Notifications</Supabase.UI.card_title>
                <Supabase.UI.card_description>Configure how you receive notifications.</Supabase.UI.card_description>
              </Supabase.UI.card_header>
              <Supabase.UI.card_content>
                <p class="text-sm text-muted-foreground">
                  We'll always let you know about important changes, but you can configure other notifications below.
                </p>
              </Supabase.UI.card_content>
              <Supabase.UI.card_footer>
                <Supabase.UI.button variant="outline" class="mr-2">Cancel</Supabase.UI.button>
                <Supabase.UI.button>Save</Supabase.UI.button>
              </Supabase.UI.card_footer>
              """
            ]
          }
        ]
      },
      %VariationGroup{
        id: :card_parts,
        description: "Individual card components",
        variations: [
          %Variation{
            id: :card_with_header,
            description: "Card with header",
            slots: [
              """
              <.card>
                <Supabase.UI.card_header>
                  <Supabase.UI.card_title>Card Title</Supabase.UI.card_title>
                  <Supabase.UI.card_description>Card Description</Supabase.UI.card_description>
                </Supabase.UI.card_header>
              </.card>
              """
            ]
          },
          %Variation{
            id: :card_with_title,
            description: "Card with title",
            slots: [
              """
              <.card>
                <div class="p-4">
                  <Supabase.UI.card_title>Card Title</Supabase.UI.card_title>
                </div>
              </.card>
              """
            ]
          },
          %Variation{
            id: :card_with_description,
            description: "Card with description",
            slots: [
              """
              <.card>
                <div class="p-4">
                  <Supabase.UI.card_description>Card Description</Supabase.UI.card_description>
                </div>
              </.card>
              """
            ]
          },
          %Variation{
            id: :card_with_content,
            description: "Card with content",
            slots: [
              """
              <.card>
                <Supabase.UI.card_content>Card Content</Supabase.UI.card_content>
              </.card>
              """
            ]
          },
          %Variation{
            id: :card_with_footer,
            description: "Card with footer",
            slots: [
              """
              <.card>
                <Supabase.UI.card_footer>Card Footer</Supabase.UI.card_footer>
              </.card>
              """
            ]
          }
        ]
      }
    ]
  end
end
