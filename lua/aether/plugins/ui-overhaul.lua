return {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
        popupmenu = {
            win_options = { winblend = 15 },
        },
        cmdline_popup = {
            win_options = { winblend = 15 },
        },
        mini = {
            win_options = { winblend = 15 },
        },
    },
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
