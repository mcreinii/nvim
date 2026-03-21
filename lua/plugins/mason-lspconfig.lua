return {
    'mason-org/mason-lspconfig.nvim',
    opts = {
        automatic_enable = true,
    },
    dependencies = {
        { 'mason-org/mason.nvim', opts = {} },
        'neovim/nvim-lspconfig',
    },
    config = function(_, opts)
        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(args)
                local buf = args.buf
                local keymap = vim.keymap.set
                local keymapOptions = { silent = true, noremap = true }

                -- Code action
                keymap('n', '<leader>la', function()
                    vim.lsp.buf.code_action()
                end, keymapOptions)

                -- Rename symbols.
                keymap('n', '<leader>lr', function()
                    vim.lsp.buf.rename(vim.fn.input('New name: ', vim.fn.expand('<cword>')))
                end, keymapOptions)

                -- Format
                keymap('n', '<leader>lf', function()
                    require('conform').format({ bufnr = buf })
                end, keymapOptions)
            end,
        })
        require('mason-lspconfig').setup(opts)
    end,
}
