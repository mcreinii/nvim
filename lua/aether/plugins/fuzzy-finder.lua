return {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    keys = {
        {
            '<leader>ff',
            function()
                require('telescope.builtin').find_files()
            end,
            desc = 'Files',
        },
        {
            '<leader>fG',
            function()
                require('telescope.builtin').git_files()
            end,
            desc = 'Git files',
        },
        {
            '<leader>fr',
            function()
                require('telescope.builtin').oldfiles()
            end,
            desc = 'Recent files',
        },
        {
            '<leader>fd',
            function()
                require('telescope.builtin').diagnostics()
            end,
            desc = 'Diagnostics',
        },
        {
            '<leader>fg',
            function()
                require('telescope.builtin').live_grep()
            end,
            desc = 'Live grep',
        },
        {
            '<leader>fb',
            function()
                require('telescope.builtin').buffers()
            end,
            desc = 'Buffers',
        },
        {
            '<leader>fh',
            function()
                require('telescope.builtin').help_tags()
            end,
            desc = 'Help tags',
        },
    },
}
