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
    { 'catppuccin/nvim', name = 'catppuccin', priority = 1000, config = function ()
        vim.cmd('colorscheme catppuccin-mocha')
    end },
}
