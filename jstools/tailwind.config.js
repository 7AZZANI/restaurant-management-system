/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["../**/templates/*.html", "../**/templates/**/*.html"],
  theme: {
    extend: {},
  },
  plugins: [require("daisyui")],
  daisyui: {
    themes: [
      {
        light: {
          ...require("daisyui/src/colors/themes")["[data-theme=light]"],
          primary: "#BB371A",
          "primary-focus": "#872712",
          secondary: "#EBA83A",
          "secondary-focus": "#B7832d",
          accent: "#cfb27f",
          "accent-focus": "#9c865f",
          "--rounded-btn": "1.9rem",
          "--tab-border": "2px",
          "--tab-radius": ".5rem",
        },
      },
    ],
  },
};
