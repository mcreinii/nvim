-- mason-lspconfig.nvim
-- to auto link LSP with mason
return {
	{
		"mason-org/mason-lspconfig.nvim",
    priority = 999,
		opts = {
			automatic_enable = true,
			ensure_installed = { "stylua", "lua_ls", "ts_ls" },
		},
		dependencies = {
		},
	},
}
