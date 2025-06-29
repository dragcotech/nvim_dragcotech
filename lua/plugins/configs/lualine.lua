return {
    'nvim-lualine/lualine.nvim', -- Fancier statusline
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
        enabled = false
    },
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'gruvbox',
            },
            sections = {
                lualine_a = {
                    {
                        'filename',
                        path = 1,
                    }
                }
            }
        }
    end
}
