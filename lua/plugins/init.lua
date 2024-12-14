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
  -- Basic
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

  'nvim-lualine/lualine.nvim', -- Fancier statusline
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  {
    'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
    event = { "BufRead", "BufNewFile" },
    config = true
  },
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  -- Treesitter
  -- {
  --   'nvim-treesitter/nvim-treesitter',
  --   build = ":TSUpdate",
  -- },
  -- -- LSP Configuration & Plugins
  -- {
  --   'neovim/nvim-lspconfig',
  --   dependencies = {
  --     -- Automatically install LSPs to stdpath for neovim
  --     'williamboman/mason.nvim',
  --     'williamboman/mason-lspconfig.nvim',

  --     -- Useful status updates for LSP
  --     'j-hui/fidget.nvim',
  --   }
  -- },
  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip'
    },
    config = function()
      -- nvim-cmp setup
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'

      cmp.setup({
        view = {
          entries = "native"
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = "neorg" },
        },
      })
    end
  },
  -- Lualine
  'nvim-lualine/lualine.nvim', -- Fancier statusline
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  {
    'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
    event = { "BufRead", "BufNewFile" },
    config = true
  },
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  'nvim-telescope/telescope-symbols.nvim',
  -- Theme
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  "ellisonleao/gruvbox.nvim",
  -- {
  --   'folke/tokyonight.nvim',
  --   lazy = false,
  --   priority = 1000,
  -- },
  --{ 'projekt0n/github-nvim-theme', name = 'github-theme' },
})

-- default theme
vim.cmd.colorscheme "catppuccin"
