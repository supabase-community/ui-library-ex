defmodule Supabase.UI.Web.ComponentsPreviewLive do
  @moduledoc false
  use Supabase.UI.Web, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, page_title: "Supabase UI Components Preview")}
  end

  def render(assigns) do
    ~H"""
    <div class="p-8 supabase-ui-web">
      <h1 class="text-3xl font-bold mb-8">Supabase UI Components Preview</h1>

      <div class="space-y-12">
        <!-- Theme Toggle -->
        <div class="flex items-center gap-4 mb-8">
          <button
            phx-click="switch-to-light"
            class="px-4 py-2 rounded-md bg-primary text-primary-foreground"
          >
            Light Mode
          </button>
          <button
            phx-click="switch-to-dark"
            class="px-4 py-2 rounded-md bg-primary text-primary-foreground"
          >
            Dark Mode
          </button>
        </div>
        
    <!-- Buttons Section -->
        <section class="space-y-4">
          <h2 class="text-2xl font-semibold mb-4">Buttons</h2>

          <div class="flex flex-wrap gap-4">
            <.button>Default</.button>
            <.button variant="destructive">Destructive</.button>
            <.button variant="outline">Outline</.button>
            <.button variant="secondary">Secondary</.button>
            <.button variant="ghost">Ghost</.button>
            <.button variant="link">Link</.button>
            <.button disabled>Disabled</.button>
          </div>

          <div class="flex flex-wrap gap-4 mt-4">
            <.button size="sm">Small</.button>
            <.button>Default Size</.button>
            <.button size="lg">Large</.button>
          </div>

          <div class="flex flex-wrap gap-4 mt-4">
            <.button size="icon">👍</.button>
            <.button size="icon" variant="ghost">⭐</.button>
            <.button size="icon" variant="outline">❤️</.button>
          </div>
        </section>
        
    <!-- Inputs Section -->
        <section class="space-y-4">
          <h2 class="text-2xl font-semibold mb-4">Inputs</h2>

          <div class="space-y-4 max-w-md">
            <.input type="text" placeholder="Default input" />
            <.input type="email" placeholder="Email input" />
            <.input type="password" placeholder="Password input" />
            <.input type="text" placeholder="Disabled input" disabled />
            <div class="flex items-start gap-2">
              <.input type="text" placeholder="With label" id="with-label" />
              <.label for="with-label">Label</.label>
            </div>
          </div>
        </section>
        
    <!-- Cards Section -->
        <section class="space-y-4">
          <h2 class="text-2xl font-semibold mb-4">Cards</h2>

          <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <.card>
              <.card_title>Simple Card</.card_title>
              <.card_content>
                This is a simple card with just a title and content.
              </.card_content>
            </.card>

            <.card>
              <.card_title>Card with Footer</.card_title>
              <.card_content>
                This card has a title, content, and a footer with actions.
              </.card_content>
              <.card_footer class="flex justify-between">
                <.button variant="ghost">Cancel</.button>
                <.button>Save</.button>
              </.card_footer>
            </.card>
          </div>
        </section>
        
    <!-- Avatars Section -->
        <section class="space-y-4">
          <h2 class="text-2xl font-semibold mb-4">Avatars</h2>

          <div class="flex flex-wrap gap-4">
            <.avatar>
              <div class="bg-primary text-primary-foreground w-full h-full flex items-center justify-center font-bold">
                ZP
              </div>
            </.avatar>

            <.avatar>
              <div class="bg-muted text-muted-foreground w-full h-full flex items-center justify-center font-bold">
                SB
              </div>
            </.avatar>

            <.avatar>
              <div class="bg-destructive text-destructive-foreground w-full h-full flex items-center justify-center font-bold">
                UI
              </div>
            </.avatar>
          </div>
        </section>
        
    <!-- Textareas Section -->
        <section class="space-y-4">
          <h2 class="text-2xl font-semibold mb-4">Textareas</h2>

          <div class="space-y-4 max-w-md">
            <.textarea placeholder="Default textarea" rows="3" />
            <.textarea placeholder="Disabled textarea" rows="3" disabled />
          </div>
        </section>
        
    <!-- Links Section -->
        <section class="space-y-4">
          <h2 class="text-2xl font-semibold mb-4">Links</h2>

          <div class="space-y-2">
            <div>
              <Supabase.UI.link href="#" class="text-primary hover:underline">
                Default Link
              </Supabase.UI.link>
            </div>
            <div>
              <Supabase.UI.link href="#" class="text-destructive hover:underline">
                Destructive Link
              </Supabase.UI.link>
            </div>
            <div>
              <Supabase.UI.link href="#" class="text-muted-foreground hover:underline">
                Muted Link
              </Supabase.UI.link>
            </div>
          </div>
        </section>
        
    <!-- Tooltips Section -->
        <section class="space-y-4">
          <h2 class="text-2xl font-semibold mb-4">Tooltips</h2>

          <div class="flex gap-8 py-12">
            <.tooltip text="This is a tooltip">
              <.button>Hover Me</.button>
            </.tooltip>

            <.tooltip text="Another tooltip with more content that wraps to multiple lines if needed">
              <.button variant="outline">Hover for Details</.button>
            </.tooltip>
          </div>
        </section>
        
    <!-- Progress Section -->
        <section class="space-y-4">
          <h2 class="text-2xl font-semibold mb-4">Progress</h2>

          <div class="space-y-4 max-w-md">
            <.progress value={25} max={100} />
            <.progress value={50} max={100} />
            <.progress value={75} max={100} />
            <.progress value={100} max={100} />
          </div>
        </section>
      </div>
    </div>
    """
  end

  def handle_event("switch-to-light", _params, socket) do
    {:noreply, push_event(socket, "toggle-theme", %{theme: "light"})}
  end

  def handle_event("switch-to-dark", _params, socket) do
    {:noreply, push_event(socket, "toggle-theme", %{theme: "dark"})}
  end
end
