vim.g.mapleader = ' '
vim.g.localmapleader = ' '

local keymaps = require('aether.utils.keymaps')

local nnoremap = keymaps.nnoremap
local vnoremap = keymaps.vnoremap
local nremap = keymaps.nremap
local vremap = keymaps.vremap

-- General
nnoremap('<leader>w', ':update<CR>', 'Save file')
nnoremap('<leader>q', ':q<CR>', 'Quit buffer')
nnoremap('<leader>Q', ':qa!<CR>', 'Quit all without saving')
nremap('<leader>/', 'gcc', 'Comment')
vremap('<leader>/', 'gc', 'Comment')

-- View
nnoremap('<C-u>', '<C-u>zz', 'Scroll up (Centered)')
nnoremap('<C-d>', '<C-d>zz', 'Scroll down (Centered)')

-- Buffers
nnoremap('<leader>bn', ':bn<cr>', 'Next buffer')
nnoremap('<leader>bp', ':bp<cr>', 'Previous buffer')
nnoremap('<leader>bd', function()
    local buffers = vim.fn.getbufinfo({ buflisted = 1 })

    if #buffers > 1 then
        vim.cmd.bnext()
        vim.cmd('silent bdelete #')
    else
        vim.cmd.enew()
        pcall(vim.cmd, 'bdelete #')
    end
end, 'Delete buffer')

nnoremap('J', ':m .+1<CR>==')
nnoremap('K', ':m .-2<CR>==')

vnoremap('J', ":m '>+1<CR>gv=gv")
vnoremap('K', ":m '<-2<CR>gv=gv")
