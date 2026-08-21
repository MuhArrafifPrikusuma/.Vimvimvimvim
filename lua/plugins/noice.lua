return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify"
  },
  opts = {
    cmdline = {
      enabled = true,
      view = "cmdline_popup", -- floating popup instead of classic bottom bar
      format = {
        cmdline = { icon = " " },
        search_down = { icon = " 󰙦 " },
        search_up = { icon = " 󰙥 " },
        filter = { icon = "$" },
        lua = { icon = " " },
        help = { icon = "󰋖" }
      }
    },
    messages = {
      enabled = true,
      view = "notify", -- routes plain messages through nvim-notify
      view_error = "notify",
      view_warn = "notify"
    },
    popupmenu = {
      enabled = true,
      backend = "nui"
    },
    -- Reposition the cmdline popup to the TOP-CENTER of the screen
    views = {
      cmdline_popup = {
        position = {
          row = 3, -- distance from the top; increase to push it further down
          col = "50%"
        },
        size = {
          min_width = 0,
          width = "30%",
          height = "auto"
        },
        border = {
          style = "rounded",
          padding = { 0, 1 }
        },
        win_options = {
          winhighlight = {
            Normal = "NoiceCmdlinePopup",
            FloatBorder = "NoiceCmdlinePopupBorder"
          }
        }
      },
      popupmenu = {
        relative = "editor",
        position = {
          row = 6, -- just under the cmdline popup
          col = "20%"
        },
        size = {
          width = 10,
          height = 10
        },
        border = {
          style = "rounded",
          padding = { 0, 1 }
        },
        win_options = {
          winhighlight = {
            Normal = "NoicePopupmenu",
            FloatBorder = "NoicePopupmenuBorder"
          }
        }
      }
    },
    -- LSP integration (optional but common with noice)
    lsp = {
      progress = { enabled = true },
      hover = { enabled = true },
      signature = { enabled = true },
      message = { enabled = true }
    },
    presets = {
      bottom_search = false,   -- since we're moving things to top
      command_palette = false, -- disable so our custom row/col positions actually apply
      long_message_to_split = true,
      inc_rename = true,
      lsp_doc_border = true
    }
  },
  config = function (_, opts)
    require("noice").setup(opts)

    -- Catppuccin Macchiato palette
    local palette = {
      rosewater = "#f4dbd6",
      flamingo  = "#f0c6c6",
      pink      = "#f5bde6",
      mauve     = "#c6a0f6",
      red       = "#ed8796",
      peach     = "#f5a97f",
      yellow    = "#eed49f",
      green     = "#a6da95",
      teal      = "#8bd5ca",
      sky       = "#91d7e3",
      sapphire  = "#7dc4e4",
      blue      = "#8aadf4",
      lavender  = "#b7bdf8",
      text      = "#cad3f5",
      base      = "#24273a",
      mantle    = "#1e2030",
      crust     = "#181926",
      surface0  = "#363a4f",
      surface1  = "#494d64",
      overlay0  = "#6e738d"
    }

    local set_hl = vim.api.nvim_set_hl

    set_hl(0, "NoiceCmdlinePopup", { bg = "none", fg = palette.text })
    set_hl(0, "NoiceCmdlinePopupBorder", { fg = palette.mauve, bg = "none" })
    set_hl(0, "NoiceCmdlineIcon", { fg = palette.pink })
    set_hl(0, "NoiceCmdlinePrompt", { fg = palette.lavender, bold = true })

    set_hl(0, "NoicePopupmenu", { bg = palette.mantle, fg = palette.text })
    set_hl(0, "NoicePopupmenuBorder", { fg = palette.blue, bg = palette.mantle })
    set_hl(0, "NoicePopupmenuSelected", { bg = palette.surface1, fg = palette.text, bold = true })

    set_hl(0, "NoiceMini", { bg = palette.base, fg = palette.text })

    -- Notify (used for messages) — Catppuccin-flavored severity colors
    require("notify").setup { background_colour = palette.base, render = "compact", stages = "fade_in_slide_out" }

    set_hl(0, "NotifyERRORBorder", { fg = palette.red })
    set_hl(0, "NotifyWARNBorder", { fg = palette.peach })
    set_hl(0, "NotifyINFOBorder", { fg = palette.green })
    set_hl(0, "NotifyDEBUGBorder", { fg = palette.overlay0 })
    set_hl(0, "NotifyTRACEBorder", { fg = palette.mauve })

    set_hl(0, "NotifyERRORIcon", { fg = palette.red })
    set_hl(0, "NotifyWARNIcon", { fg = palette.peach })
    set_hl(0, "NotifyINFOIcon", { fg = palette.green })

    set_hl(0, "NotifyERRORTitle", { fg = palette.red, bold = true })
    set_hl(0, "NotifyWARNTitle", { fg = palette.peach, bold = true })
    set_hl(0, "NotifyINFOTitle", { fg = palette.green, bold = true })
  end
}
