defmodule Storybook.UI.Textarea do
  use PhoenixStorybook.Story, :component

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
        doc: "Whether the textarea is disabled"
      },
      %PhoenixStorybook.Stories.Attr{
        id: :required,
        type: :boolean,
        doc: "Whether the textarea is required"
      },
      %PhoenixStorybook.Stories.Attr{
        id: :rows,
        type: :integer,
        doc: "Number of visible text lines",
        default: nil
      },
      %PhoenixStorybook.Stories.Attr{
        id: :value,
        type: :string,
        doc: "Textarea value"
      }
    ]
  end

  def variations do
    [
      %PhoenixStorybook.Stories.Variation{
        id: :default,
        description: "Default textarea",
        attributes: %{
          placeholder: "Type your message here..."
        }
      },
      %PhoenixStorybook.Stories.Variation{
        id: :with_rows,
        description: "Textarea with specified rows",
        attributes: %{
          placeholder: "Type your message here...",
          rows: 5
        }
      },
      %PhoenixStorybook.Stories.Variation{
        id: :disabled,
        description: "Disabled textarea",
        attributes: %{
          placeholder: "This textarea is disabled",
          disabled: true
        }
      },
      %PhoenixStorybook.Stories.Variation{
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
          %PhoenixStorybook.Stories.Variation{
            id: :description_field,
            description: "Description field with label",
            template: """
            <div class="space-y-1">
              <.label for="description">Description</.label>
              <.textarea id="description" placeholder="Enter a description..." />
            </div>
            """
          },
          %PhoenixStorybook.Stories.Variation{
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
