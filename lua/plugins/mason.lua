if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "lua-language-server",

        -- install formatters
        "stylua",

        -- install debuggers
        "debugpy",

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      -- Ensure opts.ensure_installed is a table
      opts.ensure_installed = opts.ensure_installed or {}
      
      -- 1. TypeScript Server (vtsls is the modern replacement for tsserver)
      table.insert(opts.ensure_installed, "vtsls")
      
      -- 2. PHP/Laravel Server (intelephense is highly recommended for Laravel)
      table.insert(opts.ensure_installed, "intelephense")
    end,
  },
  -- Use nvim-treesitter to ensure syntax highlighting is installed
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed then
        -- Add languages for TypeScript and Laravel
        table.insert(opts.ensure_installed, "typescript")
        table.insert(opts.ensure_installed, "tsx") -- For React TypeScript components
        table.insert(opts.ensure_installed, "php")
        table.insert(opts.ensure_installed, "php_only") -- Better blade/php parsing
      end
    end,
  },
}
