return {
  "catppuccin/nvim",
  name = "catppuccin",
  opts = {
    flavour = "macchiato",
    transparent_background = true,
    integrations = {
      -- Explicitly enable snacks integration
      snacks = true,
      treesitter = true,
      notify = true,
    },
    custom_highlights = function(colors)
      return {
        -- This targets the exact highlight group snacks.nvim uses for its ASCII header
        SnacksDashboardHeader = { fg = colors.lavender },
        -- Optional: targets the layout/buttons text color if you want them themed
        SnacksDashboardSpecial = { fg = colors.mauve },
      }
    end,
  },
}
