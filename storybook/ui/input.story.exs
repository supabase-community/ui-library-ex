defmodule Storybook.UI.Input do
  use PhoenixStorybook.Story, :component

  def function, do: &Supabase.UI.input/1
  def imports, do: [{Supabase.UI, []}]

  def doc do
    """
    An input component for user data entry.

    Input fields allow users to enter text and data in forms.
    """
  end

  def attributes do
    [
      %PhoenixStorybook.Stories.Attr{
        id: :type,
        type: :string,
        doc: "HTML input type attribute",
        values: ~w(text email password number tel url search date),
        default: "text"
      },
      %PhoenixStorybook.Stories.Attr{
        id: :class,
        type: :string,
        doc: "Additional CSS classes"
      },
      %PhoenixStorybook.Stories.Attr{
        id: :placeholder,
        type: :string,
        doc: "Placeholder text"
      },
      %PhoenixStorybook.Stories.Attr{
        id: :disabled,
        type: :boolean,
        doc: "Whether the input is disabled"
      },
      %PhoenixStorybook.Stories.Attr{
        id: :required,
        type: :boolean,
        doc: "Whether the input is required"
      },
      %PhoenixStorybook.Stories.Attr{
        id: :value,
        type: :string,
        doc: "Input value"
      }
    ]
  end

  def variations do
    [
      %PhoenixStorybook.Stories.Variation{
        id: :default,
        description: "Default input",
        attributes: %{placeholder: "Enter text here"}
      },
      %PhoenixStorybook.Stories.Variation{
        id: :email,
        description: "Email input",
        attributes: %{
          type: "email",
          placeholder: "example@email.com"
        }
      },
      %PhoenixStorybook.Stories.Variation{
        id: :password,
        description: "Password input",
        attributes: %{
          type: "password",
          placeholder: "Enter password"
        }
      },
      %PhoenixStorybook.Stories.Variation{
        id: :disabled,
        description: "Disabled input",
        attributes: %{
          disabled: true,
          placeholder: "Disabled input",
          value: "Cannot edit this"
        }
      },
      %PhoenixStorybook.Stories.Variation{
        id: :with_value,
        description: "Input with value",
        attributes: %{
          value: "Prefilled value"
        }
      }
    ]
  end

  def variation_groups do
    [
      %PhoenixStorybook.Stories.VariationGroup{
        id: :with_label,
        description: "Inputs with labels",
        template: """
        <div class="space-y-1">
          <.label for={@id}>{@label}</.label>
          <.psb-variation id={@id} />
        </div>
        """,
        variations: [
          %PhoenixStorybook.Stories.Variation{
            id: :username,
            description: "Username input with label",
            attributes: %{
              placeholder: "Enter username",
              id: "username"
            },
            extra_assigns: %{
              label: "Username",
              id: "username"
            }
          },
          %PhoenixStorybook.Stories.Variation{
            id: :email_with_label,
            description: "Email input with label",
            attributes: %{
              type: "email",
              placeholder: "Enter email",
              id: "email"
            },
            extra_assigns: %{
              label: "Email Address",
              id: "email"
            }
          }
        ]
      }
    ]
  end
end
