-- local config = {}
--
-- local nvim_config = vim.fn.stdpath("config")
-- local workspace = vim.fn.getcwd()
--
-- if nvim_config == workspace then
--   config = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (e.g., LuaJIT)
--         version = 'LuaJIT',
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = { 'vim' },
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = vim.api.nvim_get_runtime_file("", true),
--       },
--       -- Do not send telemetry data containing a randomized but unique identifier
--       telemetry = {
--         enable = false,
--       },
--     }
-- end
--
-- return {
-- 	cmd = { "lua-language-server" },
--   settings = {
--     Lua = config,
--   },
-- }

return {
	cmd = { "lua-language-server" },
	-- Default settings for general Lua files
	settings = {
		Lua = {},
	},
	on_init = function(client)
		local nvim_config_dir = vim.fn.stdpath("config")
		local workspace_path

		if client.workspace_folders and #client.workspace_folders > 0 then
			workspace_path = client.workspace_folders[1].name
		else
			-- Fallback to the current working directory
			workspace_path = vim.fn.getcwd()
		end

		-- Check if the current workspace is the Neovim config directory
		if workspace_path == nvim_config_dir then
			-- Apply Neovim-specific settings by merging them into the client's config
			local nvim_settings = {
				runtime = {
					-- Tell the language server which version of Lua you're using (e.g., LuaJIT)
					version = "LuaJIT",
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim" },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				},
				-- 				runtime = {
				-- 					version = "LuaJIT",
				-- 				},
				-- 				diagnostics = {
				-- 					globals = { "vim" },
				-- 				},
				-- 				workspace = {
				-- 					library = {
				-- 						vim.api.nvim_get_runtime_file("", true),
				-- 					},
				-- 				},
			}

			client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, nvim_settings)
			client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })

			vim.notify("Loading Neovim runtime.", vim.log.levels.INFO)
		end
	end,
}
