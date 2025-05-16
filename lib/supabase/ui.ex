defmodule Supabase.UI do
  @moduledoc """
  Supabase UI components for Phoenix LiveView.

  This library provides a collection of UI components for building Supabase-powered applications
  with Phoenix LiveView. The components are designed to be easy to use and consistent with
  the Supabase design system.

  ## Usage

  Import this module in your LiveView or LiveComponent:

      use Supabase.UI

  Then you can use the components in your templates:

      <.button>Click me</.button>
      <.input type="text" name="username" />
  """

  use Phoenix.Component

  @doc """
  Renders a button.

  ## Examples

      <.button>Send</.button>
      <.button variant="destructive">Delete</.button>
      <.button variant="outline" size="sm">Cancel</.button>

  ## Props

    * `class` - Additional CSS classes (string)
    * `variant` - Button style variant: "default", "destructive", "outline", "secondary", "ghost", or "link" (string, default: "default")
    * `size` - Button size: "default", "sm", "lg", or "icon" (string, default: "default")
    * `type` - HTML button type attribute (string, default: "button")
    * `disabled` - Whether the button is disabled (boolean)
    * `rest` - Additional HTML attributes for the button element
  """
  attr :class, :string, default: nil

  attr :variant, :string,
    default: "default",
    values: ~w(default destructive outline secondary ghost link)

  attr :size, :string, default: "default", values: ~w(default sm lg icon)
  attr :type, :string, default: "button"
  attr :disabled, :boolean, default: false
  attr :rest, :global, include: ~w(form name value)

  slot :inner_block, required: true

  def button(assigns) do
    ~H"""
    <button
      type={@type}
      class={[
        "inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium transition-colors focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring disabled:pointer-events-none disabled:opacity-50 [&_svg]:pointer-events-none [&_svg]:size-4 [&_svg]:shrink-0",
        button_variant_class(@variant),
        button_size_class(@size),
        @class
      ]}
      disabled={@disabled}
      {@rest}
    >
      {render_slot(@inner_block)}
    </button>
    """
  end

  defp button_variant_class("default"),
    do: "bg-primary text-primary-foreground shadow hover:bg-primary/90"

  defp button_variant_class("destructive"),
    do: "bg-destructive text-destructive-foreground shadow-sm hover:bg-destructive/90"

  defp button_variant_class("outline"),
    do: "border border-input bg-background shadow-sm hover:bg-accent hover:text-accent-foreground"

  defp button_variant_class("secondary"),
    do: "bg-secondary text-secondary-foreground shadow-sm hover:bg-secondary/80"

  defp button_variant_class("ghost"), do: "hover:bg-accent hover:text-accent-foreground"
  defp button_variant_class("link"), do: "text-primary underline-offset-4 hover:underline"

  defp button_size_class("default"), do: "h-9 px-4 py-2"
  defp button_size_class("sm"), do: "h-8 rounded-md px-3 text-xs"
  defp button_size_class("lg"), do: "h-10 rounded-md px-8"
  defp button_size_class("icon"), do: "h-9 w-9"

  @doc """
  Renders an input field.

  ## Examples

      <.input type="email" name="email" value="user@example.com" />
      <.input type="password" name="password" required />

  ## Props

    * `class` - Additional CSS classes (string)
    * `type` - HTML input type attribute (string, default: "text")
    * `rest` - Additional HTML attributes for the input element
  """
  attr :class, :string, default: nil
  attr :type, :string, default: "text"

  attr :rest, :global,
    include:
      ~w(autocomplete disabled form max maxlength min minlength name pattern placeholder readonly required size step value)

  def input(assigns) do
    ~H"""
    <input
      type={@type}
      class={[
        "flex h-9 w-full rounded-md border border-input bg-transparent px-3 py-1 text-base shadow-sm transition-colors file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring disabled:cursor-not-allowed disabled:opacity-50 md:text-sm",
        @class
      ]}
      {@rest}
    />
    """
  end

  @doc """
  Renders a label for a form field.

  ## Examples

      <.label for="email">Email Address</.label>

  ## Props

    * `for` - ID of the associated form element (string)
    * `class` - Additional CSS classes (string)
    * `rest` - Additional HTML attributes for the label element
  """
  attr :for, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global

  slot :inner_block, required: true

  def label(assigns) do
    ~H"""
    <label
      for={@for}
      class={[
        "text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70",
        @class
      ]}
      {@rest}
    >
      {render_slot(@inner_block)}
    </label>
    """
  end

  @doc """
  Renders a card container.

  ## Examples

      <.card>
        <.card_header>
          <.card_title>Account Settings</.card_title>
          <.card_description>Manage your account preferences</.card_description>
        </.card_header>
        <.card_content>
          Card content
        </.card_content>
        <.card_footer>
          <.button>Save Changes</.button>
        </.card_footer>
      </.card>

  ## Props

    * `class` - Additional CSS classes (string)
    * `rest` - Additional HTML attributes for the card element
  """
  attr :class, :string, default: nil
  attr :rest, :global

  slot :inner_block, required: true

  def card(assigns) do
    ~H"""
    <div
      class={[
        "rounded-lg border bg-card text-card-foreground shadow-sm",
        @class
      ]}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  @doc """
  Renders a card header section.

  ## Examples

      <.card_header>
        <.card_title>Account Settings</.card_title>
        <.card_description>Manage your account preferences</.card_description>
      </.card_header>

  ## Props

    * `class` - Additional CSS classes (string)
    * `rest` - Additional HTML attributes for the header element
  """
  attr :class, :string, default: nil
  attr :rest, :global

  slot :inner_block, required: true

  def card_header(assigns) do
    ~H"""
    <div
      class={[
        "flex flex-col space-y-1.5 p-6",
        @class
      ]}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  @doc """
  Renders a card title.

  ## Examples

      <.card_title>Account Settings</.card_title>

  ## Props

    * `class` - Additional CSS classes (string)
    * `rest` - Additional HTML attributes for the title element
  """
  attr :class, :string, default: nil
  attr :rest, :global

  slot :inner_block, required: true

  def card_title(assigns) do
    ~H"""
    <h3
      class={[
        "text-lg font-semibold leading-none tracking-tight",
        @class
      ]}
      {@rest}
    >
      {render_slot(@inner_block)}
    </h3>
    """
  end

  @doc """
  Renders a card description.

  ## Examples

      <.card_description>Manage your account preferences</.card_description>

  ## Props

    * `class` - Additional CSS classes (string)
    * `rest` - Additional HTML attributes for the description element
  """
  attr :class, :string, default: nil
  attr :rest, :global

  slot :inner_block, required: true

  def card_description(assigns) do
    ~H"""
    <p
      class={[
        "text-sm text-muted-foreground",
        @class
      ]}
      {@rest}
    >
      {render_slot(@inner_block)}
    </p>
    """
  end

  @doc """
  Renders the main content area of a card.

  ## Examples

      <.card_content>
        Card content goes here
      </.card_content>

  ## Props

    * `class` - Additional CSS classes (string)
    * `rest` - Additional HTML attributes for the content element
  """
  attr :class, :string, default: nil
  attr :rest, :global

  slot :inner_block, required: true

  def card_content(assigns) do
    ~H"""
    <div
      class={[
        "p-6 pt-0",
        @class
      ]}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  @doc """
  Renders the footer section of a card.

  ## Examples

      <.card_footer>
        <.button>Save Changes</.button>
      </.card_footer>

  ## Props

    * `class` - Additional CSS classes (string)
    * `rest` - Additional HTML attributes for the footer element
  """
  attr :class, :string, default: nil
  attr :rest, :global

  slot :inner_block, required: true

  def card_footer(assigns) do
    ~H"""
    <div
      class={[
        "flex items-center p-6 pt-0",
        @class
      ]}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  @doc """
  Renders an avatar component.

  ## Examples

      <.avatar>
        <.avatar_image src="https://example.com/avatar.jpg" alt="User" />
        <.avatar_fallback>JD</.avatar_fallback>
      </.avatar>

  ## Props

    * `class` - Additional CSS classes (string)
    * `rest` - Additional HTML attributes for the avatar element
  """
  attr :class, :string, default: nil
  attr :rest, :global

  slot :inner_block, required: true

  def avatar(assigns) do
    ~H"""
    <div
      class={[
        "relative flex h-10 w-10 shrink-0 overflow-hidden rounded-full",
        @class
      ]}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  @doc """
  Renders an avatar image.

  ## Examples

      <.avatar_image src="https://example.com/avatar.jpg" alt="User" />

  ## Props

    * `src` - Image source URL (string)
    * `alt` - Alternative text for the image (string, default: "")
    * `class` - Additional CSS classes (string)
    * `rest` - Additional HTML attributes for the image element
  """
  attr :src, :string, required: true
  attr :alt, :string, default: ""
  attr :class, :string, default: nil
  attr :rest, :global

  def avatar_image(assigns) do
    ~H"""
    <img
      src={@src}
      alt={@alt}
      class={[
        "aspect-square h-full w-full",
        @class
      ]}
      {@rest}
    />
    """
  end

  @doc """
  Renders a fallback for the avatar when the image is not available.

  ## Examples

      <.avatar_fallback>JD</.avatar_fallback>

  ## Props

    * `class` - Additional CSS classes (string)
    * `rest` - Additional HTML attributes for the fallback element
  """
  attr :class, :string, default: nil
  attr :rest, :global

  slot :inner_block, required: true

  def avatar_fallback(assigns) do
    ~H"""
    <div
      class={[
        "flex h-full w-full items-center justify-center rounded-full bg-muted",
        @class
      ]}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  @doc """
  Renders a textarea input.

  ## Examples

      <.textarea name="description" placeholder="Write a description..." />

  ## Props

    * `class` - Additional CSS classes (string)
    * `rest` - Additional HTML attributes for the textarea element
  """
  attr :class, :string, default: nil

  attr :rest, :global,
    include:
      ~w(autocomplete cols disabled form maxlength minlength name placeholder readonly required rows value wrap)

  def textarea(assigns) do
    ~H"""
    <textarea
      class={[
        "flex min-h-[80px] w-full rounded-md border border-input bg-transparent px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50",
        @class
      ]}
      {@rest}
    />
    """
  end

  @doc """
  Renders a link component styled to match the design system.

  ## Examples

      <.link href="/dashboard">Dashboard</.link>
      <.link href="/settings" variant="secondary">Settings</.link>

  ## Props

    * `href` - URL to link to (string, required)
    * `class` - Additional CSS classes (string)
    * `variant` - Link style variant: "default", "secondary", "destructive", or "ghost" (string, default: "default")
    * `rest` - Additional HTML attributes for the link element
  """
  attr :href, :string, required: true
  attr :class, :string, default: nil
  attr :variant, :string, default: "default", values: ~w(default secondary destructive ghost)
  attr :rest, :global, include: ~w(target rel)

  slot :inner_block, required: true

  def link(assigns) do
    ~H"""
    <a
      href={@href}
      class={[
        "inline-flex items-center justify-center rounded-md text-sm font-medium transition-colors focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring disabled:pointer-events-none disabled:opacity-50",
        link_variant_class(@variant),
        @class
      ]}
      {@rest}
    >
      {render_slot(@inner_block)}
    </a>
    """
  end

  defp link_variant_class("default"),
    do: "bg-primary text-primary-foreground shadow hover:bg-primary/90 h-9 px-4 py-2"

  defp link_variant_class("secondary"),
    do: "bg-secondary text-secondary-foreground shadow-sm hover:bg-secondary/80 h-9 px-4 py-2"

  defp link_variant_class("destructive"),
    do:
      "bg-destructive text-destructive-foreground shadow-sm hover:bg-destructive/90 h-9 px-4 py-2"

  defp link_variant_class("ghost"),
    do: "hover:bg-accent hover:text-accent-foreground h-9 px-4 py-2"

  @doc """
  Renders a tooltip component.

  ## Examples

      <.tooltip text="More information">
        <.button variant="ghost" size="icon"><.icon name="information-circle" /></.button>
      </.tooltip>

  ## Props

    * `text` - Text to display in the tooltip (string, required)
    * `class` - Additional CSS classes for the tooltip (string)
    * `rest` - Additional HTML attributes
  """
  attr :text, :string, required: true
  attr :class, :string, default: nil
  attr :rest, :global

  slot :inner_block, required: true

  def tooltip(assigns) do
    ~H"""
    <div class="relative group" {@rest}>
      {render_slot(@inner_block)}
      <div class={[
        "absolute z-10 invisible opacity-0 group-hover:visible group-hover:opacity-100 transition-opacity whitespace-nowrap rounded bg-popover px-3 py-1.5 text-sm text-popover-foreground shadow-md",
        "bottom-full left-1/2 transform -translate-x-1/2 -translate-y-2",
        @class
      ]}>
        {@text}
      </div>
    </div>
    """
  end

  @doc """
  Renders a progress bar.

  ## Examples

      <.progress value={60} max={100} />

  ## Props

    * `value` - Current progress value (integer, default: 0)
    * `max` - Maximum progress value (integer, default: 100)
    * `class` - Additional CSS classes (string)
    * `rest` - Additional HTML attributes for the progress element
  """
  attr :value, :integer, default: 0
  attr :max, :integer, default: 100
  attr :class, :string, default: nil
  attr :rest, :global

  def progress(assigns) do
    ~H"""
    <div class="relative w-full overflow-hidden rounded-full bg-secondary" {@rest}>
      <div
        class={[
          "h-2 w-full flex-1 bg-primary transition-all",
          @class
        ]}
        style={"transform: translateX(-#{100 - percentage(@value, @max)}%)"}
      />
    </div>
    """
  end

  defp percentage(value, max) when max > 0, do: min(100, max(0, value / max * 100))
  defp percentage(_, _), do: 0
end
