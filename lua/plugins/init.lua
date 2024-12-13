require("lazy").setup({
  -- treesitter
  -- { 'nvim-treesitter/nvim-treesitter' },
  -- basic
  "tpope/vim-commentary",
  "mattn/emmet-vim",
  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",
  "nvim-lualine/lualine.nvim",
  "vim-test/vim-test",
  "lewis6991/gitsigns.nvim",
  "tpope/vim-fugitive",
  "tpope/vim-surround",
  "stevearc/oil.nvim",
  -- completion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  -- telescope
  "nvim-lua/plenary.nvim",
  { 
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  -- theme
  "ellisonleao/gruvbox.nvim",
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
  },
  --{ 'projekt0n/github-nvim-theme', name = 'github-theme' },
})


