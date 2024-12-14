if vim.loop.os_uname().sysname == "Windows_NT" then
	require('nvim-treesitter.install').compilers = { "clang" }
end

require('nvim-treesitter.configs').setup({
	ensure_installed = {
		"lua",
		"html",
		"css",
		"javascript",
		"typescript",
		"svelte",
		"rust",
	},
	highlight = {
		enable = true,                       -- Bật tính năng highlight của Treesitter
		additional_vim_regex_highlighting = false, -- Tắt highlight mặc định của Vim
	},
	indent = {
		enable = true, -- Bật tính năng thụt lề theo Treesitter
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
	},
})
