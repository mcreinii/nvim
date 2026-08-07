return {
    -- {
    --     'wtfox/jellybeans.nvim',
    --     lazy = false,
    --     priority = 1000,
    --     opts = {},
    --     config = function()
    --         vim.cmd('colorscheme jellybeans-hc')
    --     end,
    -- },
    -- {
    --     'catppuccin/nvim',
    --     name = 'catppuccin',
    --     priority = 1000,
    --     opts = {
    --         transparent_background = true,
    --     },
    --     config = function(_, opts)
    --         require('catppuccin').setup(opts)
    --         vim.cmd('colorscheme catppuccin-mocha')
    --     end,
    -- },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        opts = {
            styles = {
                transparency = true,
            },
        },
        config = function(_, opts)
            require('rose-pine').setup(opts)
            vim.cmd('colorscheme rose-pine')
        end,
    },
}
