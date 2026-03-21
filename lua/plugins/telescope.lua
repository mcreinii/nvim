return {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    opts = {
        extensions = {
            file_browser = {
                hijack_netrw = true,
            },
        },
    },
    config = function(_, opts)
        require('telescope').setup(opts)
        require('telescope').load_extension('file_browser')

        local keymap = vim.keymap.set
        local builtin = require('telescope.builtin')
        local extensions = require('telescope').extensions

        keymap('n', '<leader>ff', builtin.find_files)
        keymap('n', '<leader>fr', builtin.oldfiles)
        keymap('n', '<leader>fg', builtin.live_grep)
        keymap('n', '<leader>fb', builtin.buffers)
        keymap('n', '<leader>fd', builtin.diagnostics)
        keymap('n', '<leader>e', extensions.file_browser.file_browser)
        keymap('n', '<leader>fh', builtin.help_tags)
    end,
}
