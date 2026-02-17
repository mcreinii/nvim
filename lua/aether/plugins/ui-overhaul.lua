return {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {},
    dependencies = {
        'MunifTanjim/nui.nvim',
        'rcarriga/nvim-notify',
    },
    keys = {
        { '<leader>mt', ':NoiceTelescope<cr>', desc = 'Telescope', silent = true, noremap = true },
        { '<leader>me', ':NoiceErrors<cr>', desc = 'Errors', silent = true, noremap = true },
        { '<leader>md', ':NoiceDismiss<cr>', desc = 'Dismiss', silent = true, noremap = true },
    },
}
