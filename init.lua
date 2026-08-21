-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  local result = vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
  if vim.v.shell_error ~= 0 then
    -- stylua: ignore
    vim.api.nvim_echo({ { ("Error cloning lazy.nvim:\n%s\n"):format(result), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
    vim.fn.getchar()
    vim.cmd.quit()
  end
end
vim.opt.rtp:prepend(lazypath)
vim.opt.shell = "/bin/sh"

local macchiato_group = vim.api.nvim_create_augroup("MacchiatoOverride", { clear = true })

vim.api.nvim_create_autocmd("ColorScheme", {
    group = macchiato_group,
    pattern = "*",
    callback = function()
        -- Force main workspace window canvas to match Kitty's background (#24273a)
        vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
        
        -- Force floating diagnostic, hover, and popup windows to match
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", ctermbg = "NONE" })
        
        -- Ensure terminal panels inside Neovim match cleanly
        vim.api.nvim_set_hl(0, "Terminal", { bg = "#24273a", ctermbg = "NONE" })
        
        -- Style sidebar layouts (like Neo-tree / NvimTree) to match perfectly
        vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "#24273a", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#24273a", ctermbg = "NONE" })
    end,
})

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"
