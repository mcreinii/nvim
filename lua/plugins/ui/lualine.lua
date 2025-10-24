-- lualine.nvim
-- Info for your mode, branch language, LSP and etc.
return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			globalstatus = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "filetype", "diff", "diagnostics" },
			lualine_c = {},
			lualine_x = { "lsp_status" },
			lualine_y = { "location" },
			lualine_z = { "progress" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
	},
}
