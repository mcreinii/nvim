return {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = 'NvimTreeToggle',
    opts = {
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
            enable = true,
            update_root = true,
        },
        view = {
            width = 30,
            side = 'left',
        },
        renderer = {
            group_empty = true,
            root_folder_label = false,
        },
        actions = {
            open_file = {
                quit_on_open = true,
            },
        },
        git = {
            enable = true,
        },
        filters = {
            dotfiles = false,
        },
    },
    keys = {
        { '<leader>e', '<cmd>NvimTreeToggle<cr>', desc = 'Toggle file explorer' },
    },
}
