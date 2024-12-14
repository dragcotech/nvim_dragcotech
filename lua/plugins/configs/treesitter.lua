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
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = false,
		disable = { "lua", "html", "css", "javascript", "typescript", "svelte", "rust" }, -- Disable for specific languages
	},
})
