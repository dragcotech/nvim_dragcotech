vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require "core"
require("core.keymaps")
require "plugins"

-- config plugin
require("plugins.configs.colorscheme")
require("plugins.configs.lualine")
require("plugins.configs.treesitter")
require("plugins.configs.telescope")
require("plugins.configs.vim-test")
require("plugins.configs.completions")
require("plugins.configs.mason")
require("plugins.configs.lsp_config")
require("plugins.configs.gitsigns")
require("plugins.configs.copilot")
require("plugins.configs.oil")
require("plugins.configs.markdown_preview")
require("plugins.configs.swagger-preview")
require("plugins.configs.nvimtree_config")
require("plugins.configs.web-devicons")
