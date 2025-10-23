local opt = vim.opt

-- UI
opt.number = true -- line numbers
opt.relativenumber = true -- relative line numbers (motion god mode)
opt.cursorline = true -- highlight current line
opt.termguicolors = true -- 24-bit colors
opt.signcolumn = "yes" -- always show sign column (for git/lsp)
opt.scrolloff = 8 -- keep context when scrolling
opt.sidescrolloff = 8

-- Indent
opt.expandtab = true -- use spaces instead of tabs
opt.shiftwidth = 2 -- indent size
opt.tabstop = 2 -- tab width
opt.smartindent = true -- autoindent new lines smartly

-- Search
opt.ignorecase = true -- ignore case by default
opt.smartcase = true -- unless capital letters are used
opt.incsearch = true -- show matches as you type
opt.hlsearch = true -- highlight all matches

-- Behavior
opt.mouse = "a" -- enable mouse
opt.clipboard = "unnamedplus" -- sync with system clipboard
opt.splitbelow = true -- horizontal splits below
opt.splitright = true -- vertical splits to the right
opt.wrap = false -- no line wrap (we ain't writing essays)
opt.confirm = true -- ask before quitting unsaved
opt.undofile = true -- persistent undo between sessions
opt.updatetime = 250 -- faster CursorHold events (LSP diagnostics)
opt.timeoutlen = 400 -- which-key feels snappy

-- File handling
opt.swapfile = false              -- we don’t do swap files here
opt.backup = false                -- no backup files either

-- UI feels
opt.showmode = false              -- no --INSERT-- mode line
opt.laststatus = 3                -- global statusline (modern Neovim)
opt.pumheight = 10                -- limit popup menu height
opt.cmdheight = 0                 -- use minimal command line height (nvim 0.9+)

-- Folds (if you use LSP or treesitter)
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99 -- open all folds by default
