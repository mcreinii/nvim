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
}
