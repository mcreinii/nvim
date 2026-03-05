return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
        preset = 'helix',
    },
    keys = {
        {
            '<leader>?',
            function()
                require('which-key').show({ global = false })
            end,
            desc = 'Buffer Local Keymaps (which-key)',
        },
    },
    config = function(_, opts)
        local wk = require('which-key')

        wk.add({
            { '<leader>b', group = 'Buffer' },
            { '<leader>f', group = 'Telescope' },
            { '<leader>l', group = 'Language', icon = '' },
            { '<leader>n', group = 'Neogit', icon = '' },
            { '<leader>m', group = 'Messages', icon = '󰵅' },
            { '<leader>E', group = 'Explorer', icon = '󱧶' },
        })
        wk.setup(opts)
    end,
}
