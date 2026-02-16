vim.g.mapleader = ' '
vim.g.localmapleader = ' '

local set = vim.keymap.set
local silent_noremap = { silent = true, noremap = true }

local function nnoremap(lhs, rhs, desc)
    set('n', lhs, rhs, vim.tbl_extend('force', silent_noremap, { desc = desc or nil }))
end

nnoremap('<C-x>', ':so<cr>', 'source')

-- General
nnoremap('<leader>w', ':w<CR>', 'Save file')
nnoremap('<leader>q', ':q<CR>', 'Quit buffer')
nnoremap('<leader>Q', ':qa!<CR>', 'Quit all without saving')

-- View
nnoremap('<C-u>', '<C-u>zz', 'Scroll up (Centered)')
nnoremap('<C-d>', '<C-d>zz', 'Scroll down (Centered)')

-- Buffers
nnoremap('<leader>bn', ':bn<cr>', 'Next buffer')
nnoremap('<leader>bp', ':bp<cr>', 'Previous buffer')
nnoremap('<leader>bd', ':bd<cr>', 'Delete buffer')
nnoremap('<leader>bf', function()
    vim.lsp.buf.format()
end, 'Format buffer')
