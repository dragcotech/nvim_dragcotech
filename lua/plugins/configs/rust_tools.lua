return {
    'simrat39/rust-tools.nvim',
    config = function()
        local rt = require("rust-tools")
        rt.setup({
            server = {
                on_attach = function(_, bufnr)
                    -- Keybindings for Rust-specific actions
                    vim.keymap.set("n", "<Leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })
                end,
            },
        })
    end
}
