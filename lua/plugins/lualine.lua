--- Lualine configuration with custom statusline and winbar
--- Features:
--- - Custom mode display with inverted colors
--- - Git diff and branch information
--- - File path in winbar with diagnostics and LSP server name
--- - Transparent backgrounds matching colorscheme

--- Helper function to create section builder
--- @param sections table The sections table to modify
--- @return table Functions to add components to left/right sections
local function create_section_builder(sections)
	return {
		left = function(component)
			table.insert(sections.lualine_c, component)
		end,
		right = function(component)
			table.insert(sections.lualine_x, component)
		end,
	}
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			globalstatus = true,
		},

		-- Statusline configuration
		sections = (function()
			local sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			}

			local hl = require("helpers.hl")
			local builder = create_section_builder(sections)

			-- Mode display mapping with highlight groups
			local mode_map = {
				n = { label = "NORMAL", hl = "String" },
				i = { label = "INSERT", hl = "Keyword" },
				v = { label = "VISUAL", hl = "Function" },
				V = { label = "V-LINE", hl = "Function" },
				["\22"] = { label = "V-BLOCK", hl = "Function" },
				c = { label = "COMMAND", hl = "Special" },
				R = { label = "REPLACE", hl = "Error" },
			}
			local normal = hl.get_hl("Normal")

			-- Mode indicator with inverted colors
			builder.left({
				function()
					local mode = vim.fn.mode()
					return (mode_map[mode] or {}).label or mode
				end,
				color = function()
					local mode = vim.fn.mode()
					local m = mode_map[mode] or {}
					local colors = hl.get_hl(m.hl or "Normal")

					return {
						fg = colors.bg or "#000000", -- invert for contrast
						bg = colors.fg or "#ffffff",
					}
				end,
				padding = { left = 1, right = 1 },
			})

			-- Git diff information
			builder.right({
				"diff",
				symbols = { added = " ", modified = " ", removed = " " },
				color = function()
					local c = hl.get_hl("DiffAdd")
					return { fg = c.fg or "#a6e22e" }
				end,
			})

			-- Git branch
			builder.right({
				"branch",
				color = {
					fg = normal.fg,
				},
				padding = { left = 1, right = 1 },
			})

			return sections
		end)(),

		-- Winbar configuration (top of window)
		winbar = (function()
			local sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			}

			local hl = require("helpers.hl")
			local builder = create_section_builder(sections)

			local normal = hl.get_hl("Normal")

			-- File path with status
			builder.left({
				"filename",
				file_status = true,
				path = 1, -- Relative path
				color = {
					fg = hl.get_hl('Directory').fg,
				},
				padding = { left = 1, right = 1 },
			})

			-- Active LSP server name
			builder.left({
				function()
					local clients = {}
					for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
						table.insert(clients, client.name)
					end
					if #clients > 0 then
						return "⚍ " .. clients[1]
					end
					return ""
				end,
				color = {
					fg = normal.fg,
					bg = normal.bg,
				},
				padding = { left = 1, right = 1 },
			})

			-- LSP diagnostics
			builder.right({
				"diagnostics",
				diagnostics_color = {
					error = hl.get_hl("DiagnosticError"),
					warn = hl.get_hl("DiagnosticWarn"),
					info = hl.get_hl("DiagnosticInfo"),
					hint = hl.get_hl("DiagnosticHint"),
				},
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
				colored = true,
				color = { bg = normal.bg },
				update_in_insert = true,
				padding = { left = 1, right = 1 },
			})

			return sections
		end)(),
	},
}
