-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- config basic
require "core"
require("core.keymaps")

-- config plugin
require "plugins"
-- require("plugins.configs.treesitter")
require("plugins.configs.lualine")
require("plugins.configs.completions")
require("plugins.configs.mason")
require("plugins.configs.lsp")
require("plugins.configs.gitsigns")
require("plugins.configs.oil")
require("plugins.configs.nvimtree")
require("plugins.configs.telescope")
-- default theme
vim.cmd.colorscheme("gruvbox")
