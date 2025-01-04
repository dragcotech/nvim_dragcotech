-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- terminal
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-w>j]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l]], { noremap = true, silent = true })

-- split
vim.keymap.set('n', '<leader>sh', ':split<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>sv', ':vsplit<CR>', { noremap = true, silent = true })

-- copy, pass from clipboard
vim.keymap.set('n', '<leader>p', '"+p', { noremap = true, silent = true })
vim.keymap.set('v', '<leader>y', '"+y', { noremap = true, silent = true })

-- prettier, formatter code .min.js
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
