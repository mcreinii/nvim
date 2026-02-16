return {
    'stevearc/conform.nvim',
    event = 'BufRead',
    opts = {
        formatters_by_ft = {
            lua = { 'stylua' },
        },
        format_on_save = {
            timeout_ms = 1000,
            lsp_format = 'fallback',
        },
    },
}
