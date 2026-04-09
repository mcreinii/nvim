--- Global keymaps configuration
--- This file contains all global keybindings
--- Plugin-specific keybindings are defined in their respective plugin files

vim.g.localmapleader = "\\"
vim.g.mapleader = " "

local map = require("helpers.keymap").set

-- Source current file
map("n", "<leader>so", function()
	vim.cmd("so %")
	print("Sourced file.")
end, { desc = "Source current file" })

-- Quick save, close, and quit
map("n", "<leader>w", ":up<cr>", { desc = "Save file" })
map("n", "<leader>q", ":q<cr>", { desc = "Quit window" })
map("n", "<leader>Q", ":qa<cr>", { desc = "Quit all" })

-- Buffer navigation
map("n", "<leader>bp", ":bp<cr>", { desc = "Previous buffer" })
map("n", "<leader>bn", ":bn<cr>", { desc = "Next buffer" })
map("n", "<leader>bd", ":bd<cr>", { desc = "Delete buffer" })

-- Center half page scrolling
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up (centered)" })
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down (centered)" })

-- Center search results
map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- Quick exit INSERT mode
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- Clear search highlights
map("n", "<leader>h", ":nohlsearch<cr>", { desc = "Clear search highlights" })

-- Move lines up and down
map("n", "<C-j>", ":m .+1<cr>==", { desc = "Move line down" })
map("n", "<C-k>", ":m .-2<cr>==", { desc = "Move line up" })
map("v", "<C-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
map("v", "<C-k>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })

-- Indenting (keep selection)
map("v", ">", ">gv", { desc = "Indent right" })
map("v", "<", "<gv", { desc = "Indent left" })
