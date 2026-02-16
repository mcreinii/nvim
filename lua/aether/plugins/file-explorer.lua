return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'MunifTanjim/nui.nvim',
        'nvim-tree/nvim-web-devicons',
    },
    lazy = false,
    ---@module 'neo-tree'
    ---@type neotree.Config
    opts = {
        popup_border_style = '',
    },
    keys = {
        { '<leader>e', ':Neotree toggle<cr>', desc = 'Open file explorer', silent = true, noremap = true },
    },
}
