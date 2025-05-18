defmodule Supabase.UI.Web.ComponentsPreviewLive do
  @moduledoc false
  use Supabase.UI.Web, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, page_title: "Supabase UI Components Library", theme: "light")}
  end

  def render(assigns) do
    ~H"""
    <div class={"supabase-ui-web #{@theme}"}>
      <div class="flex h-screen">
        <!-- Sidebar -->
        <div class="w-64 h-full bg-sidebar border-r border-sidebar-border flex flex-col">
          <div class="p-4 border-b border-sidebar-border">
            <h1 class="text-xl font-bold text-sidebar-foreground">Supabase UI</h1>
            <p class="text-sm text-sidebar-foreground/70">Phoenix LiveView Components</p>
          </div>
          <nav class="flex-1 overflow-y-auto p-4">
            <div class="space-y-1">
              <h2 class="text-xs font-semibold text-sidebar-foreground/70 uppercase tracking-wider mb-2">
                Core Components
              </h2>
              <.sidebar_link href="#buttons">Buttons</.sidebar_link>
              <.sidebar_link href="#inputs">Inputs</.sidebar_link>
              <.sidebar_link href="#cards">Cards</.sidebar_link>
              <.sidebar_link href="#avatars">Avatars</.sidebar_link>
              <.sidebar_link href="#textareas">Textareas</.sidebar_link>
              <.sidebar_link href="#links">Links</.sidebar_link>
              <.sidebar_link href="#tooltips">Tooltips</.sidebar_link>
              <.sidebar_link href="#progress">Progress</.sidebar_link>
            </div>
          </nav>
          <div class="p-4 border-t border-sidebar-border">
            <div class="flex items-center justify-between">
              <span class="text-sm text-sidebar-foreground/70">Theme</span>
              <div class="flex gap-2">
                <button
                  phx-click="switch-to-light"
                  class={"p-2 rounded-md text-xs #{if @theme == "light", do: "bg-sidebar-accent text-sidebar-accent-foreground", else: "text-sidebar-foreground/70 hover:bg-sidebar-accent/50"}"}
                >
                  Light
                </button>
                <button
                  phx-click="switch-to-dark"
                  class={"p-2 rounded-md text-xs #{if @theme == "dark", do: "bg-sidebar-accent text-sidebar-accent-foreground", else: "text-sidebar-foreground/70 hover:bg-sidebar-accent/50"}"}
                >
                  Dark
                </button>
              </div>
            </div>
          </div>
        </div>
        
    <!-- Main Content -->
        <div class="flex-1 overflow-y-auto">
          <header class="sticky top-0 z-10 bg-background border-b border-border h-16 flex items-center px-6">
            <h1 class="text-xl font-semibold">Component Library</h1>
          </header>

          <div class="px-6 py-8">
            <!-- Welcome Section -->
            <section class="mb-16">
              <div class="max-w-2xl">
                <h2 class="text-3xl font-semibold mb-3">
                  UI Components for Supabase Phoenix Projects
                </h2>
                <p class="text-lg text-muted-foreground mb-4">
                  A collection of Phoenix LiveView components that follow the Supabase design system.
                </p>
                <.button size="lg" class="mt-4">Get Started</.button>
              </div>
            </section>
            
    <!-- Components Grid -->
            <div class="relative preview-grid preview-grid-content">
              <!-- Grid Lines -->
              <div class="absolute top-0 bottom-0 left-0 right-0 z-0">
                <%= for i <- 0..12 do %>
                  <div class="preview-grid-line" style={"left: #{i / 12 * 100}%"}></div>
                <% end %>
              </div>
              
    <!-- Button Section -->
              <section id="buttons" class="col-span-12 relative z-10 mb-20">
                <div class="mb-6 flex justify-between items-center">
                  <h2 class="text-xs uppercase font-mono tracking-wider text-muted-foreground">
                    Buttons
                  </h2>
                  <.code_link>button.ex</.code_link>
                </div>
                <div class="preview-horizontal-line mb-6"></div>

                <div class="bg-card rounded-lg border border-border overflow-hidden">
                  <div class="p-6">
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
                  </div>
                  <div class="bg-muted/50 border-t border-border px-6 py-3">
                    <.component_code>
                      <.button>Default</.button>
                      <.button variant="destructive">Destructive</.button>
                      <.button variant="outline">Outline</.button>
                      <.button variant="secondary">Secondary</.button>
                      <.button variant="ghost">Ghost</.button>
                      <.button variant="link">Link</.button>
                    </.component_code>
                  </div>
                </div>
              </section>
              
    <!-- Input Section -->
              <section id="inputs" class="col-span-12 relative z-10 mb-20">
                <div class="mb-6 flex justify-between items-center">
                  <h2 class="text-xs uppercase font-mono tracking-wider text-muted-foreground">
                    Inputs
                  </h2>
                  <.code_link>input.ex</.code_link>
                </div>
                <div class="preview-horizontal-line mb-6"></div>

                <div class="bg-card rounded-lg border border-border overflow-hidden">
                  <div class="p-6">
                    <div class="space-y-4 max-w-md">
                      <.input type="text" placeholder="Default input" />
                      <.input type="email" placeholder="Email input" />
                      <.input type="password" placeholder="Password input" />
                      <.input type="text" placeholder="Disabled input" disabled />
                      <div class="flex flex-col gap-2">
                        <.label for="with-label">Label</.label>
                        <.input type="text" placeholder="With label" id="with-label" />
                      </div>
                    </div>
                  </div>
                  <div class="bg-muted/50 border-t border-border px-6 py-3">
                    <.component_code>
                      <.input type="text" placeholder="Default input" />
                      <.input type="email" placeholder="Email input" />
                      <.input type="password" placeholder="Password input" />
                      <.input type="text" placeholder="Disabled input" disabled />

                      <div class="flex flex-col gap-2">
                        <.label for="with-label">Label</.label>
                        <.input type="text" placeholder="With label" id="with-label" />
                      </div>
                    </.component_code>
                  </div>
                </div>
              </section>
              
    <!-- Cards Section -->
              <section id="cards" class="col-span-12 relative z-10 mb-20">
                <div class="mb-6 flex justify-between items-center">
                  <h2 class="text-xs uppercase font-mono tracking-wider text-muted-foreground">
                    Cards
                  </h2>
                  <.code_link>card.ex</.code_link>
                </div>
                <div class="preview-horizontal-line mb-6"></div>

                <div class="bg-card rounded-lg border border-border overflow-hidden">
                  <div class="p-6">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                      <.card>
                        <.card_header>
                          <.card_title>Simple Card</.card_title>
                          <.card_description>This is a card description</.card_description>
                        </.card_header>
                        <.card_content>
                          This is a simple card with just a title, description and content.
                        </.card_content>
                      </.card>

                      <.card>
                        <.card_header>
                          <.card_title>Card with Footer</.card_title>
                          <.card_description>This card has a footer</.card_description>
                        </.card_header>
                        <.card_content>
                          This card has a title, description, content, and a footer with actions.
                        </.card_content>
                        <.card_footer class="flex justify-between">
                          <.button variant="ghost">Cancel</.button>
                          <.button>Save</.button>
                        </.card_footer>
                      </.card>
                    </div>
                  </div>
                  <div class="bg-muted/50 border-t border-border px-6 py-3">
                    <.component_code>
                      <.card>
                        <.card_header>
                          <.card_title>Card Title</.card_title>
                          <.card_description>Card description</.card_description>
                        </.card_header>
                        <.card_content>
                          Card content
                        </.card_content>
                        <.card_footer class="flex justify-between">
                          <.button variant="ghost">Cancel</.button>
                          <.button>Save</.button>
                        </.card_footer>
                      </.card>
                    </.component_code>
                  </div>
                </div>
              </section>
              
    <!-- Avatars Section -->
              <section id="avatars" class="col-span-12 relative z-10 mb-20">
                <div class="mb-6 flex justify-between items-center">
                  <h2 class="text-xs uppercase font-mono tracking-wider text-muted-foreground">
                    Avatars
                  </h2>
                  <.code_link>avatar.ex</.code_link>
                </div>
                <div class="preview-horizontal-line mb-6"></div>

                <div class="bg-card rounded-lg border border-border overflow-hidden">
                  <div class="p-6">
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
                  </div>
                  <div class="bg-muted/50 border-t border-border px-6 py-3">
                    <.component_code>
                      <.avatar>
                        <div class="bg-primary text-primary-foreground w-full h-full flex items-center justify-center font-bold">
                          ZP
                        </div>
                      </.avatar>
                    </.component_code>
                  </div>
                </div>
              </section>
              
    <!-- Textareas Section -->
              <section id="textareas" class="col-span-12 relative z-10 mb-20">
                <div class="mb-6 flex justify-between items-center">
                  <h2 class="text-xs uppercase font-mono tracking-wider text-muted-foreground">
                    Textareas
                  </h2>
                  <.code_link>textarea.ex</.code_link>
                </div>
                <div class="preview-horizontal-line mb-6"></div>

                <div class="bg-card rounded-lg border border-border overflow-hidden">
                  <div class="p-6">
                    <div class="space-y-4 max-w-md">
                      <.textarea placeholder="Default textarea" rows="3" />
                      <.textarea placeholder="Disabled textarea" rows="3" disabled />
                    </div>
                  </div>
                  <div class="bg-muted/50 border-t border-border px-6 py-3">
                    <.component_code>
                      <.textarea placeholder="Default textarea" rows="3" />
                      <.textarea placeholder="Disabled textarea" rows="3" disabled />
                    </.component_code>
                  </div>
                </div>
              </section>
              
    <!-- Links Section -->
              <section id="links" class="col-span-12 relative z-10 mb-20">
                <div class="mb-6 flex justify-between items-center">
                  <h2 class="text-xs uppercase font-mono tracking-wider text-muted-foreground">
                    Links
                  </h2>
                  <.code_link>link.ex</.code_link>
                </div>
                <div class="preview-horizontal-line mb-6"></div>

                <div class="bg-card rounded-lg border border-border overflow-hidden">
                  <div class="p-6">
                    <div class="space-y-4">
                      <div class="flex flex-wrap gap-4">
                        <Supabase.UI.link href="#" class="text-primary hover:underline">
                          Default Link
                        </Supabase.UI.link>
                        <Supabase.UI.link href="#" class="text-destructive hover:underline">
                          Destructive Link
                        </Supabase.UI.link>
                        <Supabase.UI.link href="#" class="text-muted-foreground hover:underline">
                          Muted Link
                        </Supabase.UI.link>
                      </div>
                      <div class="flex flex-wrap gap-4">
                        <Supabase.UI.link href="#" variant="default">Button Link</Supabase.UI.link>
                        <Supabase.UI.link href="#" variant="secondary">
                          Secondary Link
                        </Supabase.UI.link>
                        <Supabase.UI.link href="#" variant="destructive">
                          Destructive Link
                        </Supabase.UI.link>
                        <Supabase.UI.link href="#" variant="ghost">Ghost Link</Supabase.UI.link>
                      </div>
                    </div>
                  </div>
                  <div class="bg-muted/50 border-t border-border px-6 py-3">
                    <.component_code>
                      <Supabase.UI.link href="#" class="text-primary hover:underline">
                        Text Link
                      </Supabase.UI.link>

                      <Supabase.UI.link href="#" variant="default">Button Link</Supabase.UI.link>
                    </.component_code>
                  </div>
                </div>
              </section>
              
    <!-- Tooltips Section -->
              <section id="tooltips" class="col-span-12 relative z-10 mb-20">
                <div class="mb-6 flex justify-between items-center">
                  <h2 class="text-xs uppercase font-mono tracking-wider text-muted-foreground">
                    Tooltips
                  </h2>
                  <.code_link>tooltip.ex</.code_link>
                </div>
                <div class="preview-horizontal-line mb-6"></div>

                <div class="bg-card rounded-lg border border-border overflow-hidden">
                  <div class="p-6">
                    <div class="flex gap-8 py-12">
                      <.tooltip text="This is a tooltip">
                        <.button>Hover Me</.button>
                      </.tooltip>

                      <.tooltip text="Another tooltip with more content that wraps to multiple lines if needed">
                        <.button variant="outline">Hover for Details</.button>
                      </.tooltip>
                    </div>
                  </div>
                  <div class="bg-muted/50 border-t border-border px-6 py-3">
                    <.component_code>
                      <.tooltip text="This is a tooltip">
                        <.button>Hover Me</.button>
                      </.tooltip>
                    </.component_code>
                  </div>
                </div>
              </section>
              
    <!-- Progress Section -->
              <section id="progress" class="col-span-12 relative z-10 mb-20">
                <div class="mb-6 flex justify-between items-center">
                  <h2 class="text-xs uppercase font-mono tracking-wider text-muted-foreground">
                    Progress
                  </h2>
                  <.code_link>progress.ex</.code_link>
                </div>
                <div class="preview-horizontal-line mb-6"></div>

                <div class="bg-card rounded-lg border border-border overflow-hidden">
                  <div class="p-6">
                    <div class="space-y-4 max-w-md">
                      <.progress value={25} max={100} />
                      <.progress value={50} max={100} />
                      <.progress value={75} max={100} />
                      <.progress value={100} max={100} />
                    </div>
                  </div>
                  <div class="bg-muted/50 border-t border-border px-6 py-3">
                    <.component_code>
                      <.progress value={25} max={100} />
                      <.progress value={50} max={100} />
                      <.progress value={75} max={100} />
                      <.progress value={100} max={100} />
                    </.component_code>
                  </div>
                </div>
              </section>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end

  def sidebar_link(assigns) do
    ~H"""
    <a
      href={@href}
      class="flex items-center px-3 py-2 text-sm rounded-md text-sidebar-foreground/90 hover:bg-sidebar-accent hover:text-sidebar-accent-foreground"
    >
      {render_slot(@inner_block)}
    </a>
    """
  end

  def code_link(assigns) do
    ~H"""
    <a
      href="#"
      class="text-xs font-mono text-foreground underline decoration-1 decoration-muted-foreground underline-offset-4 transition-colors hover:text-primary"
    >
      {render_slot(@inner_block)}
    </a>
    """
  end

  def component_code(assigns) do
    ~H"""
    <pre class="text-xs text-muted-foreground font-mono p-2 overflow-x-auto"><code><%= render_slot(@inner_block) %></code></pre>
    """
  end

  def handle_event("switch-to-light", _params, socket) do
    {:noreply, socket |> assign(:theme, "light") |> push_event("toggle-theme", %{theme: "light"})}
  end

  def handle_event("switch-to-dark", _params, socket) do
    {:noreply, socket |> assign(:theme, "dark") |> push_event("toggle-theme", %{theme: "dark"})}
  end
end
