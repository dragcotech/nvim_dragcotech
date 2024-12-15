-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Terminal
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = true
    },
    -- BufferLine
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons'
    },
    -- Tree
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    -- Git related plugins
    'tpope/vim-fugitive',
    'lewis6991/gitsigns.nvim',
    -- Lualine
    'nvim-lualine/lualine.nvim', -- Fancier statusline
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
        enabled = false
    },
    {
        'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
        event = { "BufRead", "BufNewFile" },
        config = true
    },
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
    },
    -- LSP Configuration & Plugins
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            'j-hui/fidget.nvim',
        }
    },
    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
            'hrsh7th/cmp-buffer',
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
        },
    },
    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    'nvim-telescope/telescope-symbols.nvim',
    -- Theme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000
    },
    "ellisonleao/gruvbox.nvim",
    -- {
    --   'folke/tokyonight.nvim',
    --   lazy = false,
    --   priority = 1000,
    -- },
    --{ 'projekt0n/github-nvim-theme', name = 'github-theme' },
})

-- default theme
vim.cmd.colorscheme "gruvbox"
