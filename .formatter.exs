# Used by "mix format"
[
  import_deps: [:phoenix],
  plugins: [Phoenix.LiveView.HTMLFormatter, Styler],
  inputs: ["*.{ex,exs,heex}", "{config,lib,test}/**/*.{ex,exs,heex}", "storybook/**/*.exs"]
]
