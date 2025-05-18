defmodule Storybook.UI.Input do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias PhoenixStorybook.Stories.Attr
  alias PhoenixStorybook.Stories.Variation

  def function, do: &Supabase.UI.input/1
  def imports, do: [{Supabase.UI, []}]

  def attributes do
    [
      %Attr{
        id: :type,
        type: :string,
        doc: "HTML input type attribute",
        values: ~w(text email password number tel url search date),
        default: "text"
      },
      %Attr{
        id: :class,
        type: :string,
        doc: "Additional CSS classes"
      },
      %Attr{
        id: :placeholder,
        type: :string,
        doc: "Placeholder text"
      },
      %Attr{
        id: :disabled,
        type: :boolean,
        doc: "Whether the input is disabled"
      },
      %Attr{
        id: :required,
        type: :boolean,
        doc: "Whether the input is required"
      },
      %Attr{
        id: :value,
        type: :string,
        doc: "Input value"
      }
    ]
  end

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default input",
        attributes: %{placeholder: "Enter text here"}
      },
      %Variation{
        id: :email,
        description: "Email input",
        attributes: %{
          type: "email",
          placeholder: "example@email.com"
        }
      },
      %Variation{
        id: :password,
        description: "Password input",
        attributes: %{
          type: "password",
          placeholder: "Enter password"
        }
      },
      %Variation{
        id: :disabled,
        description: "Disabled input",
        attributes: %{
          disabled: true,
          placeholder: "Disabled input",
          value: "Cannot edit this"
        }
      },
      %Variation{
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
          %Variation{
            id: :username,
            description: "Username input with label",
            attributes: %{
              placeholder: "Enter username",
              label: "Username",
              id: "username"
            }
          },
          %Variation{
            id: :email_with_label,
            description: "Email input with label",
            attributes: %{
              type: "email",
              placeholder: "Enter email",
              id: "email",
              label: "Email Address"
            }
          }
        ]
      }
    ]
  end
end
