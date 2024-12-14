vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
})

vim.keymap.set('n', '<leader>e', ':NvimTreeFindFile<CR>')

-- vim.keymap.set('n', '<c-n>', ':NvimTreeFindFile<CR>')
-- vim.keymap.set('n', '<c-t>', ':NvimTreeClose<CR>')
