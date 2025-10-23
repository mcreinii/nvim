return {
	-- Fancy ui
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
	},

	-- Neo-Tree file explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		opts = {
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
				},
			},
		},
		config = function()
			-- Toggle using <leader>ne
			vim.keymap.set(
				"n",
				"<leader>ne",
				"<cmd>Neotree toggle<cr>",
				{ noremap = true, silent = true, desc = "Toggle file tree/explorer (Neotree)" }
			)
		end,
		lazy = false,
	},

	-- Nvim-Treesitter for syntax highlighting.
	{
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
	},

	-- Status line (Lualine)
	-- Info for your mode, branch language, LSP and etc.
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				always_show_tabline = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
					refresh_time = 16, -- ~60fps
					events = {
						"WinEnter",
						"BufEnter",
						"BufWritePost",
						"SessionLoadPost",
						"FileChangedShellPost",
						"VimResized",
						"Filetype",
						"CursorMoved",
						"CursorMovedI",
						"ModeChanged",
					},
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "filetype", "diff", "diagnostics" },
				lualine_c = {},
				lualine_x = { "lsp", "fileformat" },
				lualine_y = { "location" },
				lualine_z = { "progress" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		},
	},

	-- Which-Key
	{
		"folke/which-key.nvim",
		opts = {},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
		lazy = false,
		config = function()
			local wk = require("which-key")
			wk.add({
				{ "<leader>l", group = "LSP" },
				{ "<leader>lg", group = "Go to" },
				{ "<leader>b", group = "Buffer" },
				{ "<leader>n", group = "Neotree" },
				{ "<leader>s", group = "Window Splits" },
				{ "<leader>[", group = "Jump Left" },
				{ "<leader>]", group = "Jump Right" },
				{ "<leader>v", group = "Vim" },
			})
		end,
	},
}
