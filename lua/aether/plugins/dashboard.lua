return {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    config = function()
        local dashboard = require('alpha.themes.dashboard')

        dashboard.section.header.val = [[
    ___        __  __             
   /   | ___  / /_/ /_  ___  _____
  / /| |/ _ \/ __/ __ \/ _ \/ ___/
 / ___ /  __/ /_/ / / /  __/ /    
/_/  |_\___/\__/_/ /_/\___/_/     
                                  
        ]]

        dashboard.section.buttons.val = {
            dashboard.button('e', 'New file', ':ene <BAR> startinsert<CR>'),
            dashboard.button('<leader>e', 'File explorer'),
            dashboard.button('<leader>ff', 'Find files'),
            dashboard.button('<leader>fr', 'Recent files'),
            dashboard.button('<leader>fG', 'Git files'),
            dashboard.button('<leader>fg', 'Live grep'),
        }
        require('alpha').setup(dashboard.config)
    end,
}
