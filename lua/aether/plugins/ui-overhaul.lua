return {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
        popupmenu = { win_options = { winblend = 15 } },
        cmdline_popup = { win_options = { winblend = 15 } },
        mini = { win_options = { winblend = 15 } },

        -- optionally set default view for messages
        messages = { view = 'notify', view_error = 'notify', view_warn = 'notify' },
    },
    keys = {
        { '<leader>mt', ':NoiceTelescope<cr>', desc = 'Telescope', silent = true, noremap = true },
        { '<leader>me', ':NoiceErrors<cr>', desc = 'Errors', silent = true, noremap = true },
        { '<leader>md', ':NoiceDismiss<cr>', desc = 'Dismiss', silent = true, noremap = true },
    },
}
