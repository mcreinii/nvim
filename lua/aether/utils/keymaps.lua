local M = {}

local set = vim.keymap.set
local silent_noremap = { silent = true, noremap = true }
local silent_remap = { silent = true, remap = true }
local silent = { silent = true }

function M.nnoremap(lhs, rhs, desc)
    set('n', lhs, rhs, vim.tbl_extend('force', silent_noremap, { desc = desc or nil }))
end

function M.nremap(lhs, rhs, desc)
    set('n', lhs, rhs, vim.tbl_extend('force', silent_remap, { desc = desc or nil }))
end

function M.n(lhs, rhs, desc)
    set('n', lhs, rhs, vim.tbl_extend('force', silent, { desc = desc or nil }))
end

function M.vnoremap(lhs, rhs, desc)
    set('v', lhs, rhs, vim.tbl_extend('force', silent_noremap, { desc = desc or nil }))
end

function M.vremap(lhs, rhs, desc)
    set('v', lhs, rhs, vim.tbl_extend('force', silent_remap, { desc = desc or nil }))
end

function M.v(lhs, rhs, desc)
    set('v', lhs, rhs, vim.tbl_extend('force', silent, { desc = desc or nil }))
end

return M
