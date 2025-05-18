defmodule Storybook.UI.Textarea do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias PhoenixStorybook.Stories.Attr
  alias PhoenixStorybook.Stories.Variation

  def function, do: &Supabase.UI.textarea/1
  def imports, do: [{Supabase.UI, []}]

  def doc do
    """
    A textarea component for multiline text input.

    Textarea fields allow users to enter longer text content spanning multiple lines.
    """
  end

  def attributes do
    [
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
        doc: "Whether the textarea is disabled"
      },
      %Attr{
        id: :required,
        type: :boolean,
        doc: "Whether the textarea is required"
      },
      %Attr{
        id: :rows,
        type: :integer,
        doc: "Number of visible text lines",
        default: nil
      },
      %Attr{
        id: :value,
        type: :string,
        doc: "Textarea value"
      }
    ]
  end

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default textarea",
        attributes: %{
          placeholder: "Type your message here..."
        }
      },
      %Variation{
        id: :with_rows,
        description: "Textarea with specified rows",
        attributes: %{
          placeholder: "Type your message here...",
          rows: 5
        }
      },
      %Variation{
        id: :disabled,
        description: "Disabled textarea",
        attributes: %{
          placeholder: "This textarea is disabled",
          disabled: true
        }
      },
      %Variation{
        id: :with_value,
        description: "Textarea with value",
        attributes: %{
          value: "This is some prefilled text in the textarea."
        }
      }
    ]
  end

  def variation_groups do
    [
      %PhoenixStorybook.Stories.VariationGroup{
        id: :with_label,
        description: "Textareas with labels",
        template: """
        <div class="space-y-4">
          <.psb-variation-group/>
        </div>
        """,
        variations: [
          %Variation{
            id: :description_field,
            description: "Description field with label",
            template: """
            <div class="space-y-1">
              <.label for="description">Description</.label>
              <.textarea id="description" placeholder="Enter a description..." />
            </div>
            """
          },
          %Variation{
            id: :comments_field,
            description: "Comments field with label",
            template: """
            <div class="space-y-1">
              <.label for="comments">Comments</.label>
              <.textarea id="comments" placeholder="Enter your comments..." rows="4" />
            </div>
            """
          }
        ]
      }
    ]
  end
end
