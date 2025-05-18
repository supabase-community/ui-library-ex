/** @type {import('tailwindcss').Config} */
module.exports = {
  important: ".supabase-ui-web",
  darkMode: ["class", '[data-theme="dark"]'],
  content: ["./lib/**/*.{ex,heex}", "../storybook/**/*.*exs"],
  theme: {
    container: {
      center: true,
      padding: "2rem",
      screens: {
        "2xl": "1400px",
      },
    },
    extend: {
      colors: {
        background:
          "color-mix(in srgb, hsl(var(--background)) 100%, transparent)",
        foreground:
          "color-mix(in srgb, hsl(var(--foreground)) 100%, transparent)",
        border: "color-mix(in srgb, hsl(var(--border)) 100%, transparent)",
        input: "color-mix(in srgb, hsl(var(--input)) 100%, transparent)",
        ring: "color-mix(in srgb, hsl(var(--ring)) 100%, transparent)",
        primary: {
          DEFAULT: "color-mix(in srgb, hsl(var(--primary)) 100%, transparent)",
          foreground:
            "color-mix(in srgb, hsl(var(--primary-foreground)) 100%, transparent)",
        },
        secondary: {
          DEFAULT:
            "color-mix(in srgb, hsl(var(--secondary)) 100%, transparent)",
          foreground:
            "color-mix(in srgb, hsl(var(--secondary-foreground)) 100%, transparent)",
        },
        destructive: {
          DEFAULT:
            "color-mix(in srgb, hsl(var(--destructive)) 100%, transparent)",
          foreground:
            "color-mix(in srgb, hsl(var(--destructive-foreground)) 100%, transparent)",
        },
        muted: {
          DEFAULT: "color-mix(in srgb, hsl(var(--muted)) 100%, transparent)",
          foreground:
            "color-mix(in srgb, hsl(var(--muted-foreground)) 100%, transparent)",
        },
        accent: {
          DEFAULT: "color-mix(in srgb, hsl(var(--accent)) 100%, transparent)",
          foreground:
            "color-mix(in srgb, hsl(var(--accent-foreground)) 100%, transparent)",
        },
        popover: {
          DEFAULT: "color-mix(in srgb, hsl(var(--popover)) 100%, transparent)",
          foreground:
            "color-mix(in srgb, hsl(var(--popover-foreground)) 100%, transparent)",
        },
        card: {
          DEFAULT: "color-mix(in srgb, hsl(var(--card)) 100%, transparent)",
          foreground:
            "color-mix(in srgb, hsl(var(--card-foreground)) 100%, transparent)",
        },
      },
      borderRadius: {
        lg: "var(--radius)",
        md: "calc(var(--radius) - 2px)",
        sm: "calc(var(--radius) - 4px)",
      },
      keyframes: {
        "accordion-down": {
          from: { height: 0 },
          to: { height: "var(--radix-accordion-content-height)" },
        },
        "accordion-up": {
          from: { height: "var(--radix-accordion-content-height)" },
          to: { height: 0 },
        },
        "fade-in": {
          from: { opacity: 0 },
          to: { opacity: 1 },
        },
        "fade-out": {
          from: { opacity: 1 },
          to: { opacity: 0 },
        },
      },
      animation: {
        "accordion-down": "accordion-down 0.2s ease-out",
        "accordion-up": "accordion-up 0.2s ease-out",
        "fade-in": "fade-in 0.2s ease-out",
        "fade-out": "fade-out 0.2s ease-out",
      },
    },
  },
  plugins: [require("tailwindcss-animate")],
};
