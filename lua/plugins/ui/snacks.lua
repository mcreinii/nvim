return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  ---@class snacks.dashboard.Config
  ---@field enabled? boolean
  ---@field sections snacks.dashboard.Section
  ---@field formats table<string, snacks.dashboard.Text|fun(item:snacks.dashboard.Item, ctx:snacks.dashboard.Format.ctx):snacks.dashboard.Text>
  opts = {
    dashboard = {
      preset = {
        ---@type snacks.dashboard.Item[]
        keys = {
          {
            icon = " ",
            key = "f",
            desc = "Find File",
            action = ":lua Snacks.dashboard.pick('files')"
          },
          {
            icon = "󰒲 ",
            key = "L",
            desc = "Lazy",
            action = ":Lazy",
            enabled = package.loaded.lazy ~= nil
          },
          {
            icon = " ",
            key = "q",
            desc = "Quit",
            action = ":qa"
          }
        },
        header = [[
▖  ▖  ▖ ▖  ▘
▛▖▞▌▛▘▛▖▌▌▌▌▛▛▌
▌▝ ▌▙▖▌▝▌▚▘▌▌▌▌
        ]],
      },
      sections = {

        {
          section = "header",
        },
        {
          section = "terminal",
          cmd = "pipe.sh > /dev/null 2>&1 || bash-pipes > /dev/null 2>&1 || echo "
        },
        {
          section = "keys"
        },
      }
    },
  },
}
