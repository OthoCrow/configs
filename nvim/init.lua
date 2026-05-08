local o = vim.o
local bo = vim.bo
local wo = vim.wo

-- Tabs and indentation
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = false
o.autoindent = true
bo.autoindent = true

-- Display and behavior
wo.number = true
o.clipboard = "unnamedplus"
o.syntax = "on"

o.wildmode = "longest,list"

-- If you want to ensure filetype plugins and indent are enabled:
vim.cmd([[
  filetype plugin indent on
]])


-----------------------------
----------LAZY.NVIM----------
-----------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- Comment plugin
    {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end,
    },

    -- LSP
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- LSP configuration
    end,
  },
  
  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      -- nvim-cmp configuration
    end,
  },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
