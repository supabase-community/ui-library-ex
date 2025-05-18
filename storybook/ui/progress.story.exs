defmodule Storybook.UI.Progress do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias PhoenixStorybook.Stories.Attr
  alias PhoenixStorybook.Stories.Variation

  def function, do: &Supabase.UI.progress/1
  def imports, do: [{Supabase.UI, []}]

  def attributes do
    [
      %Attr{
        id: :value,
        type: :integer,
        doc: "Current progress value",
        default: 0
      },
      %Attr{
        id: :max,
        type: :integer,
        doc: "Maximum progress value",
        default: 100
      },
      %Attr{
        id: :class,
        type: :string,
        doc: "Additional CSS classes"
      }
    ]
  end

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default progress bar (0%)",
        attributes: %{
          value: 0
        }
      },
      %Variation{
        id: :in_progress,
        description: "Progress in progress (40%)",
        attributes: %{
          value: 40
        }
      },
      %Variation{
        id: :almost_complete,
        description: "Almost complete (75%)",
        attributes: %{
          value: 75
        }
      },
      %Variation{
        id: :complete,
        description: "Complete (100%)",
        attributes: %{
          value: 100
        }
      },
      %Variation{
        id: :custom_max,
        description: "Custom maximum value",
        attributes: %{
          value: 350,
          max: 1000
        }
      },
      %Variation{
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
          %Variation{
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
          %Variation{
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
          %Variation{
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
