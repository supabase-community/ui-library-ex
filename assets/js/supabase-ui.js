/**
 * Phoenix LiveView Hooks for Supabase UI components
 */

// Tooltip custom behavior for LiveView
const Tooltip = {
  mounted() {
    // Track position for exact placement
    if (this.el.dataset.tooltipPosition) {
      this.position = this.el.dataset.tooltipPosition;
    } else {
      this.position = "top";
    }

    // Find tooltip content
    this.tooltip = this.el.querySelector("[data-tooltip-content]");

    if (!this.tooltip) return;

    // Position tooltip correctly based on parent position
    this.positionTooltip();

    // Handle window resize events
    window.addEventListener("resize", () => this.positionTooltip());
  },

  positionTooltip() {
    // Apply appropriate positioning classes based on position attribute
    const positions = {
      top: "bottom-full left-1/2 transform -translate-x-1/2 -translate-y-2",
      bottom: "top-full left-1/2 transform -translate-x-1/2 translate-y-2",
      left: "right-full top-1/2 transform -translate-y-1/2 -translate-x-2",
      right: "left-full top-1/2 transform -translate-y-1/2 translate-x-2",
    };

    // Clear all position classes
    Object.values(positions).forEach((cls) => {
      const classes = cls.split(" ");
      classes.forEach((c) => this.tooltip.classList.remove(c));
    });

    // Apply correct position classes
    const posClasses = positions[this.position].split(" ");
    posClasses.forEach((c) => this.tooltip.classList.add(c));
  },

  beforeDestroy() {
    window.removeEventListener("resize", this.resizeHandler);
  },
};

// Theme handling for toggling between light and dark mode
const ThemeHandler = {
  mounted() {
    // Listen for theme toggle events
    this.handleEvent("toggle-theme", ({ theme }) => {
      document.documentElement.classList.remove("dark");
      if (theme === "dark") {
        document.documentElement.classList.add("dark");
      }
    });
  },
};

export default {
  Tooltip,
  ThemeHandler,
};
