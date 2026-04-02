return {
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = {
            lua = { 'stylua' },
            typescript = { 'prettierd', 'prettier', stop_on_first = true },
            typescriptreact = { 'prettierd', 'prettier', stop_on_first = true },
            javascript = { 'prettierd', 'prettier', stop_on_first = true },
            javascriptreact = { 'prettierd', 'prettier', stop_on_first = true },
        },
    },
}
