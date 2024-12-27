-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- split
vim.keymap.set('n', '<leader>sh', ':split<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>sv', ':vsplit<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap(
    'n',
    '<leader>fm',
    ':!prettier --write %<CR>',
    { noremap = true, silent = true }
)

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.js",
    callback = function()
        vim.cmd("silent! !prettier --write " .. vim.fn.expand("%"))
    end,
})
