local map = vim.keymap.set
local opts = {noremap = true, silent = true}

-------------
-- General --
-------------

map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
map("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "Clear highlights" })
map("n", "<leader>r", "<cmd>edit!<cr>", { desc = "Reload file" })

-- Yank / Paste from system clipboard
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })
map("n", "<leader>p", '"+p', { desc = "Paste from clipboard" })

-- Move lines up/down 🕺
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Resize splits 🔧
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Stay in indent mode while shifting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

------------------------
-- Windows navigation --
------------------------

map("n", "<leader>sv", "<C-w>v", { desc = "Split vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Equalize splits" })
map("n", "<leader>sx", "<cmd>close<cr>", { desc = "Close split" })

-- Navigate between splits easily
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-------------
-- Buffers --
-------------

map("n", "<leader>bc", "<cmd>bdelete<cr>", {desc = "Delete buffer"})
map("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Buffer (Next)" })
map("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Buffer (Prev)" })

------------
-- Neovim --
------------

map("n", "<leader>vq", "<cmd>qa<cr>", {desc = "Quit Neovim"})
map("n", "<leader>vQ", "<cmd>qa!<cr>", {desc = "Quit Neovim (Force)"})
