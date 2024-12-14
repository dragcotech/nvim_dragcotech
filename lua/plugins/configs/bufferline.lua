vim.opt.termguicolors = true
require("bufferline").setup {}

-- Phím tắt
vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', { silent = true })
vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { silent = true })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { silent = true })
vim.keymap.set('n', '<leader>bc', ':BufferLinePickClose<CR>', { silent = true })
vim.keymap.set('n', '<leader>bb', ':BufferLinePick<CR>', { silent = true })
