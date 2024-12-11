vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- split
vim.keymap.set('n', '<leader>sh', ':split<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>sv', ':vsplit<CR>', { noremap = true, silent = true })

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.cmd [[ set noswapfile ]]
vim.cmd [[ set termguicolors ]]

--Line numbers
vim.wo.number = true

-- language setting
vim.cmd("language en_US")
