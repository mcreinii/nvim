-- noice.nvim
-- Fancy UI
return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		cmdline = {
			view = "cmdline",
		},
		presets = {
			lsp_doc_border = false,
			bottom_search = true,
			command_palette = false,
		},
		views = {
			cmdline_popup = {
				position = {
					row = 10,
					col = "50%",
				},
				border = {
					style = "none",
					padding = { 2, 3 },
				},
				size = {
					min_width = 60,
					width = "auto",
					height = "auto",
				},
				win_options = {
					winhighlight = { NormalFloat = "NormalFloat", FloatBorder = "FloatBorder" },
				},
			},
			cmdline_popupmenu = {
				relative = "editor",
				position = {
					row = 13,
					col = "50%",
				},
				size = {
					width = 60,
					height = "auto",
					max_height = 15,
				},
				border = {
					style = "none",
					padding = { 0, 3 },
				},
				win_options = {
					winhighlight = { NormalFloat = "NormalFloat", FloatBorder = "NoiceCmdlinePopupBorder" },
				},
			},
			hover = {
				border = {
					style = "single",
				},
			},
			confirm = {
				border = {
					style = "single",
				},
			},
			popup = {
				border = {
					style = "single",
				},
			},
		},
	},
}
