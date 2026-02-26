vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
    -- {
    --     'nvim-neo-tree/neo-tree.nvim',
    --     branch = 'v3.x',
    --     dependencies = {
    --         'nvim-lua/plenary.nvim',
    --         'MunifTanjim/nui.nvim',
    --         'nvim-tree/nvim-web-devicons',
    --     },
    --     lazy = false,
    --     ---@module 'neo-tree'
    --     ---@type neotree.Config
    --     opts = {
    --         popup_border_style = '',
    --     },
    --     keys = {
    --         { '<leader>e', ':Neotree toggle<cr>', desc = 'Open file explorer', silent = true, noremap = true },
    --     },
    -- },
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {

            'nvim-tree/nvim-web-devicons',
        },
        opts = {
            sync_root_with_cwd = true,
            hijack_cursor = true,
            view = {
                width = 30,
                side = 'left',
            },
            renderer = {
                highlight_opened_files = 'name',
                indent_markers = { enable = true },
            },
            filters = {
                dotfiles = false,
            },
            git = {
                ignore = false,
            },
            update_focused_file = {
                enable = true,
                update_root = true,
            },
        },
        keys = {
            { '<leader>e', ':NvimTreeToggle<cr>', desc = 'Open file explorer', silent = true, noremap = true },
        },
    },
}
