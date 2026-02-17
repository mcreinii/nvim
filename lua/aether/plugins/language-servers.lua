return {
    'mason-org/mason-lspconfig.nvim',
    opts = {
        ensure_installed = {
            'lua_ls',
            'stylua',
        },
    },
    dependencies = {
        {
            'mason-org/mason.nvim',
            opts = {},
        },
        { 'neovim/nvim-lspconfig' },
    },
    config = function()
        local function on_attach(_, bufnr)
            local nnoremap = require('aether.utils.keymaps').nnoremap

            nnoremap('<leader>la', vim.lsp.buf.code_action, 'Code Action')
            nnoremap('<leader>lr', vim.lsp.buf.rename, 'Rename')
            nnoremap('<leader>ld', vim.diagnostic.open_float, 'Line Diagnostics')
            nnoremap('<leader>lD', vim.lsp.buf.definition, 'Definition')
            nnoremap('<leader>lR', vim.lsp.buf.references, 'References')
            nnoremap('<leader>lh', vim.lsp.buf.hover, 'Hover')
        end

        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(args)
                on_attach(_, args.buf)
            end,
        })

        require('mason-lspconfig').setup({})
    end,
}
