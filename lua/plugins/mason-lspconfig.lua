--- LSP configuration with Mason integration
--- Mason automatically installs and manages LSP servers
--- LSP servers are configured with sensible defaults and can be customized here

return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		-- Automatically enable LSP servers installed via Mason
		automatic_enable = true,
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
	config = function(_, opts)
		local map = require("helpers.keymap").set

		-- Setup LSP keybindings when LSP attaches to a buffer
		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "Configure LSP keybindings on buffer attach",
			callback = function(args)
				local buf = args.buf

				-- Code actions (show available fixes/refactorings)
				map("n", "<leader>la", function()
					vim.lsp.buf.code_action()
				end, { buffer = buf, desc = "LSP code action" })

				-- Rename symbol under cursor
				map("n", "<leader>lr", function()
					vim.lsp.buf.rename(vim.fn.input("New name: ", vim.fn.expand("<cword>")))
				end, { buffer = buf, desc = "LSP rename symbol" })

				-- Format current buffer using conform.nvim
				map("n", "<leader>lf", function()
					require("conform").format({ bufnr = buf, timeout_ms = 5000 })
				end, { buffer = buf, desc = "LSP format buffer" })

				-- Show diagnostics in floating window
				map("n", "<leader>ld", function()
					vim.diagnostic.open_float()
				end, { buffer = buf, desc = "LSP show diagnostics" })

				-- Go to definition
				map("n", "<leader>lD", function()
					vim.lsp.buf.definition()
				end, { buffer = buf, desc = "LSP go to definition" })

				-- Find all references
				map("n", "<leader>lR", function()
					vim.lsp.buf.references()
				end, { buffer = buf, desc = "LSP find references" })
			end,
		})

		-- Initialize mason-lspconfig
		-- This will automatically configure LSP servers installed through Mason
		-- Default capabilities and handlers are applied to all servers
		require("mason-lspconfig").setup(opts)
	end,
}
