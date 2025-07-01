return {
    'AckslD/muren.nvim',
    config = function()
        require('muren').setup() -- cấu hình mặc định

        -- Gán phím tắt, ví dụ: <leader>mr để mở giao diện Muren
        vim.keymap.set('n', '<leader>mr', function()
            require('muren').open()
        end, { desc = 'Open Muren UI' })
    end,
}
