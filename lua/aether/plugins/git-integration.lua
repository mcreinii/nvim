return {
    'NeogitOrg/neogit',
    lazy = true,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'sindrets/diffview.nvim',
        'nvim-telescope/telescope.nvim',
    },
    cmd = 'Neogit',
    keys = {
        { '<leader>ns', ':Neogit<cr>', desc = 'UI', silent = true, noremap = true },
        { '<leader>np', ':Neogit pull<cr>', desc = 'Pull', silent = true, noremap = true },
        { '<leader>nP', ':Neogit push<cr>', desc = 'Push', silent = true, noremap = true },
    },
}
