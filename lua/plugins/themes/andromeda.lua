return {
    {
        "nobbmaestro/nvim-andromeda",
        dependencies = {
            { "tjdevries/colorbuddy.nvim", branch = "dev" }
        },
        lazy = false, -- Load at startup
        priority = 1000, -- Load before other plugins
        config = function()
            vim.g.andromeda_enable_italic = true
            vim.g.andromeda_transparent = false
            vim.cmd("colorscheme andromeda")
        end,
    },
}
