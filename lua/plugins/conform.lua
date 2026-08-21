return {
  "stevearc/conform.nvim",
  -- AstroNvim will automatically merge this with its default plugin specifications
  opts = {
    formatters_by_ft = {
      c = { "clang-format" },
      go = { "gofumpt", "goimports" },
      rust = { "rustfmt" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      cmake = { "gersemi" },
      make = {}, -- Falls back to Neovim's internal layout engine
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
}
