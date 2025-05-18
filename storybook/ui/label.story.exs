defmodule Storybook.UI.Label do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias PhoenixStorybook.Stories.Attr
  alias PhoenixStorybook.Stories.Variation

  def function, do: &Supabase.UI.label/1
  def imports, do: [{Supabase.UI, []}]

  def doc do
    """
    A label component for form inputs.

    Labels help users understand what information is required in a form field.
    """
  end

  def attributes do
    [
      %Attr{
        id: :for,
        type: :string,
        doc: "ID of the associated form element"
      },
      %Attr{
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
        doc: "Label content",
        required: true
      }
    ]
  end

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default label",
        attributes: %{for: "email"},
        slots: ["Email address"]
      },
      %Variation{
        id: :required,
        description: "Required field label",
        attributes: %{for: "password"},
        slots: ["Password *"]
      },
      %Variation{
        id: :with_custom_class,
        description: "Label with custom styling",
        attributes: %{
          for: "name",
          class: "text-primary"
        },
        slots: ["Full Name"]
      }
    ]
  end

  def variation_groups do
    [
      %PhoenixStorybook.Stories.VariationGroup{
        id: :with_inputs,
        description: "Labels with inputs",
        template: """
        <div class="space-y-4">
          <.psb-variation-group />
        </div>
        """,
        variations: [
          %Variation{
            id: :label_with_text_input,
            description: "Label with text input",
            template: """
            <div class="space-y-1">
              <.label for="text-input">Text Input</.label>
              <.input id="text-input" placeholder="Enter text" />
            </div>
            """
          },
          %Variation{
            id: :label_with_email_input,
            description: "Label with email input",
            template: """
            <div class="space-y-1">
              <.label for="email-input">Email Address</.label>
              <.input id="email-input" type="email" placeholder="example@email.com" />
            </div>
            """
          },
          %Variation{
            id: :label_with_password_input,
            description: "Label with password input",
            template: """
            <div class="space-y-1">
              <.label for="password-input">Password</.label>
              <.input id="password-input" type="password" placeholder="Enter password" />
            </div>
            """
          }
        ]
      }
    ]
  end
end
