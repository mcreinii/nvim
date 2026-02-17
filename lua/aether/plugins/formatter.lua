return {
    'stevearc/conform.nvim',
    event = 'BufRead',
    opts = {
        formatters_by_ft = {
            lua = { 'stylua' },
            typescriptreact = { 'prettierd', 'prettier', stop_on_first = true },
            typescript = { 'prettierd', 'prettier', stop_on_first = true },
            javascriptreact = { 'prettierd', 'prettier', stop_on_first = true },
            javascript = { 'prettierd', 'prettier', stop_on_first = true },
        },
        format_on_save = {
            timeout_ms = 1000,
            lsp_format = 'fallback',
        },
    },
}
