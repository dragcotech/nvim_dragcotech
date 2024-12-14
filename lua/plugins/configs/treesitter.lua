require 'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = {
		"lua",
		"bash",
		"css",
		"html",
		"javascript",
		"typescript",
		"json",
		"yaml",
		"svelte",
		"rust"
	},

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}
