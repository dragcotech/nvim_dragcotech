local status, telescope = pcall(require, 'telescope')
if not status then return end

local builtin = require('telescope.builtin')

telescope.setup({
    defaults = {
        file_ignore_patterns = { "%.git/*", "%.doc/*", "%target/*", "%.sqlx/*", "%.svelte%-kit/*", "%node_modules/*" }
    }
})

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
