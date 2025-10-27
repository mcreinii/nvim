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
			lualine_z = {
				{
					function()
						local current_line = vim.fn.line(".")
						local total_lines = vim.fn.line("$")
						local char_empty = " "
						local char_bar = "█"
				  local size = 3

				  local line_ratio = current_line / total_lines

				  local index = math.ceil(line_ratio * size)

				  local bar = ""

				  for len = 0, size - 1 do
					  if len < index then
						  bar = bar .. char_empty
					  else
						  bar = bar .. char_bar
					  end
				  end

				  return bar
			  end,
			  padding = { left = 0, right = 0 },
		  },
	  },
  },
  inactive_sections = {
	  lualine_a = {},
	  lualine_b = {},
	  lualine_c = {},
	  lualine_x = {},
	  lualine_y = {},
	  lualine_z = {},
  },  },
}
