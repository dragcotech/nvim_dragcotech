return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",

    config = function()
        -- If It run on windows, set clang compiler
        if vim.loop.os_uname().sysname == "Windows_NT" then
            require('nvim-treesitter.install').compilers = { "clang" }
        end

        require('nvim-treesitter.configs').setup({
            ensure_installed = {
                "lua",
                "html",
                "css",
                "sass",
                "scss",
                "tsx",
                "javascript",
                "typescript",
                "svelte",
                "rust",
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },
        })
    end
}
