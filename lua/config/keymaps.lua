vim.g.localmapleader = '\\'
vim.g.mapleader = ' '

local keymap = vim.keymap.set
local opts = { silent = true, noremap = true }

-- Specials, NetRW and sourcing
keymap('n', '<leader>e', ':Ex<cr>', opts)
keymap('n', '<leader>so', function()
    vim.cmd('so %')
    print('Sourced file.')
end, opts)

-- Quick save, close, and quit Nvim.
keymap('n', '<leader>w', ':up<cr>', opts)
keymap('n', '<leader>q', ':q<cr>', opts)
keymap('n', '<leader>Q', ':qa<cr>', opts)

-- Buffer delete, previous, and next
keymap('n', '<leader>bp', ':bp<cr>', opts)
keymap('n', '<leader>bn', ':bn<cr>', opts)
keymap('n', '<leader>bd', ':bd<cr>', opts)

-- Center half page scrolling.
keymap('n', '<C-u>', '<C-u>zz', opts)
keymap('n', '<C-d>', '<C-d>zz', opts)

-- Center search result cycles.
keymap('n', 'n', 'nzzzv', opts)
keymap('n', 'N', 'Nzzzv', opts)

-- Quick exit out of INSERT mode.
keymap('i', 'jk', '<Esc>', opts)

-- Clear highlights.
keymap('n', '<leader>h', ':nohlsearch<cr>', opts)

-- Move lines around.
keymap('n', '<C-j>', ':m .+1<cr>==', opts)
keymap('n', '<C-k>', ':m .-2<cr>==', opts)
keymap('v', '<C-j>', ":m '>+1<cr>gv=gv", opts)
keymap('v', '<C-k>', ":m '<-2<cr>gv=gv", opts)

-- Indenting
keymap('v', '>', '>gv', opts)
keymap('v', '<', '<gv', opts)
