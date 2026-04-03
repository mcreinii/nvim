--- Keymap helper module for consistent keymap configurations
--- Provides standardized options and utilities for setting keymaps across the configuration

local M = {}

--- Default options for keymaps
--- @type table
M.opts = { silent = true, noremap = true }

--- Set a keymap with default options
--- @param mode string|table Mode(s) to set the keymap for
--- @param lhs string Left-hand side of the keymap
--- @param rhs string|function Right-hand side of the keymap
--- @param opts? table Optional keymap options (merged with defaults)
function M.set(mode, lhs, rhs, opts)
	opts = vim.tbl_extend("force", M.opts, opts or {})
	vim.keymap.set(mode, lhs, rhs, opts)
end

--- Set multiple keymaps at once
--- @param mappings table Array of {mode, lhs, rhs, opts?} tables
function M.set_multiple(mappings)
	for _, mapping in ipairs(mappings) do
		local mode, lhs, rhs, opts = mapping[1], mapping[2], mapping[3], mapping[4]
		M.set(mode, lhs, rhs, opts)
	end
end

return M
