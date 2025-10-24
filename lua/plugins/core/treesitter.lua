-- nvim-treesitter
-- Nvim-Treesitter for syntax highlighting.
return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	opts = {
		ensure_installed = { "lua", "vim" },
		auto_install = true,
		highlight = {
			enable = true,

			-- You can add your own highlight disable logic here.

			additional_vim_regex_highlighting = false,
		},
	},
}
