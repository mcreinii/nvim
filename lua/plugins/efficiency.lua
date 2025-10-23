return {
	-- Autopairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},

	-- Telescope (Fuzzy finder)
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files (Telescope)" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep (Telescope)" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers (Telescope)" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags (Telescope)" })
		end,
	},

	-- Comment
	{
		"numToStr/Comment.nvim",
		opts = {
			-- add any options here
		},
	},
}
