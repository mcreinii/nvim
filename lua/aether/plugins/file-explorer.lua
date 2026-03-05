vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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
        filesystem = {
            use_libuv_file_watcher = true,
        },
        popup_border_style = '',
        window = {
            width = (function()
                return math.floor(vim.o.columns * 0.25)
            end)(),
        },
    },
    keys = {
        { '<leader>e', ':Neotree toggle<cr>', desc = 'Open file explorer', silent = true, noremap = true },
        {
            '<leader>Er',
            function()
                require('neo-tree.sources.manager').refresh()
            end,
            desc = 'Reload Neotree',
            silent = true,
            noremap = true,
        },
    },
}
