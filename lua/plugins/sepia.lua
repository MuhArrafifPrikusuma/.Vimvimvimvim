return {
  "echasnovski/mini.nvim",
  version = false,
  config = function ()
    -- ── "Old Letters" vintage palette — softened pass ──
    -- Colors pulled down in saturation/brightness vs. the previous version
    -- so nothing shouts. `rust` is now reserved ONLY for error/diagnostic
    -- highlights — it is not used for any syntax role below.
    local sepia = {
      ink     = "#241f1d", -- base background (irrelevant once transparent)
      surface = "#3a322d", -- lighter bg / statusline bg
      faded   = "#8c8171", -- comments, muted/deprecated (lightened, still soft)
      cream   = "#d8c9a3", -- secondary foreground
      text    = "#ddd0b8", -- default foreground (slightly muted, easy to read)
      clay    = "#c99b83", -- red slot  -> variables/tags (soft terracotta, NOT error)
      amber   = "#d1a672", -- orange    -> numbers/constants (lightened)
      gold    = "#d9c17a", -- yellow    -> classes/types (desaturated, less "loud")
      olive   = "#b3bf94", -- green     -> strings (softer sage, easier on the eyes)
      teal    = "#9bb8ae", -- cyan      -> regex/escapes/support (lightened)
      slate   = "#98b2bd", -- blue      -> functions/methods (lightened)
      plum    = "#b49bb0", -- purple    -> keywords/storage (lightened)
      brown   = "#9c8b76", -- deprecated / embedded tags
      rust    = "#c05f3c" -- ⚠ reserved for errors ONLY — not assigned below
    }

    require("mini.base16").setup({
      palette = {
        base00 = sepia.ink,     -- default bg
        base01 = sepia.surface, -- lighter bg (statusline, etc.)
        base02 = sepia.faded,   -- selection bg
        base03 = sepia.faded,   -- comments, invisibles
        base04 = sepia.cream,   -- dark fg (statusline text)
        base05 = sepia.text,    -- default fg, operators, delimiters
        base06 = sepia.text,    -- light fg
        base07 = "#fff6df",     -- lightest fg (rare use, e.g. cursor)
        base08 = sepia.clay,    -- variables, tags  (NOT rust — see note above)
        base09 = sepia.amber,   -- numbers, booleans, constants
        base0A = sepia.gold,    -- classes, types, search bg
        base0B = sepia.olive,   -- strings, inserted
        base0C = sepia.teal,    -- regex, escapes, support
        base0D = sepia.slate,   -- functions, methods, headings
        base0E = sepia.plum,    -- keywords, storage, changed
        base0F = sepia.brown    -- deprecated, embedded tags
      }
    })

    -- ── Rust reserved strictly for errors ──
    -- mini.base16 doesn't put base08 on diagnostics/error groups by default,
    -- but we set these explicitly so `rust` shows up ONLY here, nowhere else.
    local error_groups = {
      "DiagnosticError", "DiagnosticSignError", "DiagnosticUnderlineError", "ErrorMsg", "DiffDelete", "SpellBad"
    }
    for _, group in ipairs(error_groups) do
      vim.api.nvim_set_hl(0, group, { fg = sepia.rust, bg = "NONE" })
    end

    -- ── Transparency: clear backgrounds, keep foreground colors ──
    local transparent_groups = {
      "Normal", "NormalNC", "NormalFloat", "FloatBorder", "FloatTitle", "SignColumn", "FoldColumn", "EndOfBuffer",
      "VertSplit", "WinSeparator", "LineNr", "CursorLineNr", "Pmenu", "PmenuSel", "TabLine", "TabLineFill", "StatusLine",
      "StatusLineNC", "MsgArea"
    }
    for _, group in ipairs(transparent_groups) do
      vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
    end

    -- ── Gutter / line numbers: force fully transparent background ──
    -- Set explicitly (and after the loop above) so nothing else — colorscheme
    -- reloads, statusline plugins, etc. — can quietly re-apply a bg here.
    vim.api.nvim_set_hl(0, "LineNr", { fg = sepia.faded, bg = "NONE" })
    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = sepia.faded, bg = "NONE" })
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = sepia.faded, bg = "NONE" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = sepia.gold, bg = "NONE", bold = false })

    -- CursorLine: subtle line highlight, no background fill (keeps the
    -- gutter's transparency intact since CursorLineNr is set separately).
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE", underline = false })
  end
}
