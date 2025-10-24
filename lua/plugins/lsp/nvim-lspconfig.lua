-- nvim-lspconfig
-- LSP on attach keybinds.
-- use vim.lsp.config("server-name", { ...config })
-- to configure servers.
return {
	"neovim/nvim-lspconfig",
  priority = 1000,
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local bufnr = args.buf

				-- Code action
				vim.keymap.set(
					"n",
					"<leader>la",
					vim.lsp.buf.code_action,
					{ noremap = true, silent = true, buffer = bufnr, desc = "Code action (LSP)" }
				)

				-- Source action
				vim.keymap.set("n", "<leader>lA", function()
					vim.lsp.buf.code_action({
						context = { only = { "source" } },
						apply = false,
					})
				end, { noremap = true, silent = true, buffer = bufnr, desc = "Source action (LSP)" })

				-- Diagnostics
				vim.keymap.set("n", "<leader>[d", function()
					vim.diagnostic.jump({ count = -1, float = true })
				end, { noremap = true, silent = true, buffer = bufnr, desc = "Diagnostic (Prev)" })
				vim.keymap.set("n", "<leader>]d", function()
					vim.diagnostic.jump({ count = 1, float = true })
				end, { noremap = true, silent = true, buffer = bufnr, desc = "Diagnostic (Prev)" })

				-- Format
				vim.keymap.set("n", "<leader>lf", function()
					vim.lsp.buf.format()
				end, { noremap = true, silent = true, buffer = bufnr, desc = "Format buffer (LSP)" })

				-- Rename
				vim.keymap.set("n", "<leader>lr", function()
					vim.lsp.buf.rename()
				end, { noremap = true, silent = true, buffer = bufnr, desc = "Rename symbol (LSP)" })

				-- Hover
				vim.keymap.set("n", "<leader>lr", function()
					vim.lsp.buf.hover()
				end, { noremap = true, silent = true, buffer = bufnr, desc = "Hover (LSP)" })

				-- Signatures
				vim.keymap.set("n", "<leader>ls", function()
					vim.lsp.buf.signature_help()
				end, { noremap = true, silent = true, buffer = bufnr, desc = "Signatures (LSP)" })

				-- Go to Definitions
				vim.keymap.set("n", "<leader>lgd", function()
					vim.lsp.buf.definition()
				end, { noremap = true, silent = true, buffer = bufnr, desc = "Go to Definitions (LSP)" })

				-- Go to References
				vim.keymap.set("n", "<leader>lgr", function()
					vim.lsp.buf.hover()
				end, { noremap = true, silent = true, buffer = bufnr, desc = "Go to References (LSP)" })

				-- Go to Declarations
				vim.keymap.set("n", "<leader>lgD", function()
					vim.lsp.buf.declaration()
				end, { noremap = true, silent = true, buffer = bufnr, desc = "Hover (LSP)" })

				-- Go to Implementation
				vim.keymap.set("n", "<leader>lgi", function()
					vim.lsp.buf.implementation()
				end, { noremap = true, silent = true, buffer = bufnr, desc = "Go to Implementation (LSP)" })

				-- Types
				vim.keymap.set("n", "<leader>lt", function()
					vim.lsp.buf.type_definition()
				end, { noremap = true, silent = true, buffer = bufnr, desc = "Type Definition (LSP)" })
			end,
		})
	end,
}
