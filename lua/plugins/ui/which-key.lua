-- which-key.nvim
-- Keybinds help and info
return {
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
			{ "<leader>f", group = "Fuzzy | Telescope" },
			{ "<leader>s", group = "Window Splits" },
			{ "<leader>[", group = "Jump Left" },
			{ "<leader>]", group = "Jump Right" },
			{ "<leader>v", group = "Vim" },
		})
	end,
}
