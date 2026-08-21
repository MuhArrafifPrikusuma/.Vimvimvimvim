-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  {
    "mbbill/undotree",
    cmd = { "UndotreeToggle" },
  },

  -- == Examples of Overriding Plugins ==

  -- customize dashboard options
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
            [[
░▀▀▀▀▀▄ ░▀▀▀▀▀ ▄▀▀▀▀▀▄ ░     ░ ░ ░▀▀▄▀▀▄
▒     ▒ ▒▄▄▄▄  ▒     ▒ ▒     ▒ ▒ ▒  ▒  ▒
▓     ▓ ▓      ▓     ▓ ▀▄   ▄▀ ▓ ▓  ▓  ▓
▀     ▀ ▀▀▀▀▀▀  ▀▀▀▀▀    ▀▀▀   ▀ ▀     ▀
▒     ▒ ▒▀▀▀▀▀ ▄▀▀▀▀▀▄  ▄▀▀▀▄  ▒ ▒  ▄  ▒
▓     ▓ ▓▄▄▄▄  ▓     ▓ ▓     ▓ ▓ ▓  ▓  ▓
▓     ▓ ▓      ▓     ▓ ▓     ▓ ▓ ▓  ▓  ▓
▀▀▀▀▀▀  ▀▀▀▀▀▀  ▀▀▀▀▀  ▀     ▀ ▀ ▀▀▀ ▀▀ 
          ]],
          }, "\n"),
        },
        -- Force EVERY text component of the dashboard structure to use our color group
        sections = {
          { section = "header", hl = "SnacksDashboardHeader" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      },
    },
    -- Force-apply the Macchiato Lavender color globally to all potential fallback groups
    init = function()
      local function apply_lavender()
        local macchiato_lavender = "#b7bdf8"
        -- Force-paint the Snacks dashboard group
        vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = macchiato_lavender, bg = "NONE", force = true })
        -- Force-paint standard fallbacks in case snacks ignores its own group
        vim.api.nvim_set_hl(0, "Title", { fg = macchiato_lavender, bg = "NONE", force = true })
      end

      -- 1. Apply immediately on boot
      apply_lavender()

      -- 2. Apply again every time any colorscheme loads to protect it
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = apply_lavender,
      })
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })

      -- include the default astronvim config that calls the setup call
      require "astronvim.plugins.configs.luasnip"(plugin, opts)
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts)
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules({
        Rule("$", "$", { "tex", "latex" })
          :with_pair(cond.not_after_regex "%%")
          :with_pair(cond.not_before_regex("xxx", 3))
          :with_move(cond.none())
          :with_del(cond.not_after_regex "xx")
          :with_cr(cond.none()),
      }, Rule("a", "a", "-vim"))
    end,
  },

}
