defmodule Storybook.UI.Progress do
  use PhoenixStorybook.Story, :component

  def function, do: &Supabase.UI.progress/1
  def imports, do: [{Supabase.UI, []}]

  def doc do
    """
    A progress bar component.

    Progress bars visualize the completion status of an operation or task.
    """
  end

  def attributes do
    [
      %PhoenixStorybook.Stories.Attr{
        id: :value,
        type: :integer,
        doc: "Current progress value",
        default: 0
      },
      %PhoenixStorybook.Stories.Attr{
        id: :max,
        type: :integer,
        doc: "Maximum progress value",
        default: 100
      },
      %PhoenixStorybook.Stories.Attr{
        id: :class,
        type: :string,
        doc: "Additional CSS classes"
      }
    ]
  end

  def variations do
    [
      %PhoenixStorybook.Stories.Variation{
        id: :default,
        description: "Default progress bar (0%)",
        attributes: %{
          value: 0
        }
      },
      %PhoenixStorybook.Stories.Variation{
        id: :in_progress,
        description: "Progress in progress (40%)",
        attributes: %{
          value: 40
        }
      },
      %PhoenixStorybook.Stories.Variation{
        id: :almost_complete,
        description: "Almost complete (75%)",
        attributes: %{
          value: 75
        }
      },
      %PhoenixStorybook.Stories.Variation{
        id: :complete,
        description: "Complete (100%)",
        attributes: %{
          value: 100
        }
      },
      %PhoenixStorybook.Stories.Variation{
        id: :custom_max,
        description: "Custom maximum value",
        attributes: %{
          value: 350,
          max: 1000
        }
      },
      %PhoenixStorybook.Stories.Variation{
        id: :custom_class,
        description: "Custom styled progress bar",
        attributes: %{
          value: 60,
          class: "bg-green-500"
        }
      }
    ]
  end

  def variation_groups do
    [
      %PhoenixStorybook.Stories.VariationGroup{
        id: :with_labels,
        description: "Progress bars with labels",
        template: """
        <div class="space-y-6">
          <.psb-variation-group />
        </div>
        """,
        variations: [
          %PhoenixStorybook.Stories.Variation{
            id: :upload_progress,
            description: "Upload progress",
            template: """
            <div class="space-y-2">
              <div class="flex justify-between">
                <span class="text-sm font-medium">Uploading file...</span>
                <span class="text-sm font-medium">25%</span>
              </div>
              <.progress value={25} />
            </div>
            """
          },
          %PhoenixStorybook.Stories.Variation{
            id: :download_progress,
            description: "Download progress",
            template: """
            <div class="space-y-2">
              <div class="flex justify-between">
                <span class="text-sm font-medium">Downloading update...</span>
                <span class="text-sm font-medium">75%</span>
              </div>
              <.progress value={75} />
            </div>
            """
          },
          %PhoenixStorybook.Stories.Variation{
            id: :processing_progress,
            description: "Processing progress",
            template: """
            <div class="space-y-2">
              <div class="flex justify-between">
                <span class="text-sm font-medium">Processing data...</span>
                <span class="text-sm font-medium">90%</span>
              </div>
              <.progress value={90} />
            </div>
            """
          }
        ]
      }
    ]
  end
end
