defmodule Storybook.MyPage do
  # See https://hexdocs.pm/phoenix_storybook/PhoenixStorybook.Story.html for full story
  # documentation.
  @moduledoc false
  use PhoenixStorybook.Story, :page

  def doc, do: "Welcome to Supabase UI Library for Phoenix LiveView"

  # Declare an optional tab-based navigation in your page:
  def navigation do
    [
      {:welcome, "Welcome"},
      {:components, "Components"},
      {:about, "About"}
    ]
  end

  def render(%{tab: :welcome} = assigns) do
    ~H"""
    <div class="psb-welcome-page">
      <h1 class="text-3xl font-bold mb-6">Supabase UI Library for Phoenix LiveView</h1>

      <p class="mb-4">
        This is a comprehensive UI component library for building Phoenix LiveView applications
        with Supabase integration. It provides ready-to-use components for authentication, storage,
        realtime features, and general UI elements.
      </p>

      <h2 class="text-2xl font-bold mt-8 mb-4">Component Categories</h2>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
        <div class="bg-secondary/10 p-6 rounded-lg">
          <h3 class="text-xl font-bold mb-2 flex items-center">
            <span class="mr-2">🧩</span> UI Components
          </h3>
          <p>Core UI components like buttons, inputs, cards, and more.</p>
        </div>

        <div class="bg-secondary/10 p-6 rounded-lg">
          <h3 class="text-xl font-bold mb-2 flex items-center">
            <span class="mr-2">🔐</span> Auth Components
          </h3>
          <p>Authentication components for login, signup, password reset, etc.</p>
        </div>

        <div class="bg-secondary/10 p-6 rounded-lg">
          <h3 class="text-xl font-bold mb-2 flex items-center">
            <span class="mr-2">☁️</span> Storage Components
          </h3>
          <p>File upload and management components for Supabase Storage.</p>
        </div>

        <div class="bg-secondary/10 p-6 rounded-lg">
          <h3 class="text-xl font-bold mb-2 flex items-center">
            <span class="mr-2">⚡</span> Realtime Components
          </h3>
          <p>Realtime components for collaborative experiences with Supabase Realtime.</p>
        </div>
      </div>

      <h2 class="text-2xl font-bold mt-8 mb-4">Getting Started</h2>

      <p class="mb-4">
        Browse the component categories in the sidebar to explore available components, their properties, and usage examples.
        Each component includes interactive examples and detailed documentation.
      </p>

      <p class="mb-4">
        Use the tabs above to learn more about the component system, usage guidelines, and more.
      </p>
    </div>
    """
  end

  def render(%{tab: :components} = assigns) do
    ~H"""
    <div class="psb-welcome-page">
      <h1 class="text-3xl font-bold mb-6">Component System</h1>

      <p class="mb-4">
        The Supabase UI Library is built on a cohesive component system that follows modern design principles
        and best practices. All components are designed to work seamlessly together and provide a consistent
        user experience.
      </p>

      <h2 class="text-2xl font-bold mt-8 mb-4">Design Principles</h2>

      <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
        <div class="bg-secondary/10 p-6 rounded-lg">
          <h3 class="text-xl font-bold mb-2">Consistency</h3>
          <p>Components follow consistent patterns in their API design, styling, and behavior.</p>
        </div>

        <div class="bg-secondary/10 p-6 rounded-lg">
          <h3 class="text-xl font-bold mb-2">Accessibility</h3>
          <p>
            Components are built with accessibility in mind, following WCAG guidelines and best practices.
          </p>
        </div>

        <div class="bg-secondary/10 p-6 rounded-lg">
          <h3 class="text-xl font-bold mb-2">Composability</h3>
          <p>Components can be easily combined to create complex interfaces and user experiences.</p>
        </div>
      </div>

      <h2 class="text-2xl font-bold mt-8 mb-4">Component Structure</h2>

      <p class="mb-4">
        Each component in the library follows a consistent structure:
      </p>

      <ul class="list-disc ml-8 mb-6">
        <li class="mb-2">Clear and consistent API with well-documented properties</li>
        <li class="mb-2">Consistent handling of props and events</li>
        <li class="mb-2">Built-in support for common variations (size, variant, color, etc.)</li>
        <li class="mb-2">Composition-friendly design using slots and context where appropriate</li>
        <li class="mb-2">Thorough testing and accessibility validation</li>
      </ul>
    </div>
    """
  end

  def render(%{tab: :about} = assigns) do
    ~H"""
    <div class="psb-welcome-page">
      <h1 class="text-3xl font-bold mb-6">About Supabase UI Library</h1>

      <p class="mb-4">
        The Supabase UI Library for Phoenix LiveView is a collection of high-quality, production-ready components
        that make it easy to build beautiful and functional web applications with Supabase as the backend.
      </p>

      <h2 class="text-2xl font-bold mt-8 mb-4">Features</h2>

      <ul class="list-disc ml-8 mb-6">
        <li class="mb-2">Ready-to-use UI components that follow modern design principles</li>
        <li class="mb-2">Authentication components that work seamlessly with Supabase Auth</li>
        <li class="mb-2">
          Storage components for easy file uploads and management with Supabase Storage
        </li>
        <li class="mb-2">
          Realtime components for building collaborative experiences with Supabase Realtime
        </li>
        <li class="mb-2">Fully responsive and accessible components</li>
        <li class="mb-2">Consistent API and design language across all components</li>
        <li class="mb-2">Easy customization and theming options</li>
      </ul>

      <h2 class="text-2xl font-bold mt-8 mb-4">Technologies</h2>

      <p class="mb-4">
        This library is built with:
      </p>

      <ul class="list-disc ml-8 mb-6">
        <li class="mb-2">Phoenix LiveView - for real-time, server-rendered components</li>
        <li class="mb-2">Tailwind CSS - for responsive, utility-first styling</li>
        <li class="mb-2">
          Supabase SDK for Elixir - for seamless integration with Supabase services
        </li>
      </ul>
    </div>
    """
  end
end
