-- lualine.nvim
-- Info for your mode, branch language, LSP and etc.

local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

return {
  "nvim-lualine/lualine.nvim",

  opts = {
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      globalstatus = true,
    },
    sections = (function()
      local sects = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      }

      local function insert_to_left(component)
        table.insert(sects.lualine_c, component)
      end

      local function insert_to_right(component)
        table.insert(sects.lualine_x, component)
      end

      -- Modes
      insert_to_left {
        function()
          return '██'
        end,
        color = function()
          local mode_color = {
            n = colors.red,
            i = colors.green,
            v = colors.blue,
            [''] = colors.blue,
            V = colors.blue,
            c = colors.magenta,
            no = colors.red,
            s = colors.orange,
            S = colors.orange,
            [''] = colors.orange,
            ic = colors.yellow,
            R = colors.violet,
            Rv = colors.violet,
            cv = colors.red,
            ce = colors.red,
            r = colors.cyan,
            rm = colors.cyan,
            ['r?'] = colors.cyan,
            ['!'] = colors.red,
            t = colors.red,
          }
          return { fg = mode_color[vim.fn.mode()] }
        end,
        padding = { left = 0 }
      }

      -- Git branches
      insert_to_left {
        "branch",
        icon = ' ',
        color = { fg = colors.green },
      }

      -- Filetype
      insert_to_left { "filetype" }

      -- Git diff.
      insert_to_left {
        'diff',
        symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
        diff_color = {
          added = { fg = colors.green },
          modified = { fg = colors.orange },
          removed = { fg = colors.red },
        },
        cond = conditions.hide_in_width,
      }

      -- Diagnostics
      insert_to_right {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
        diagnostics_color = {
          error = { fg = colors.red },
          warn = { fg = colors.yellow },
          info = { fg = colors.cyan },
        },
      }

      -- LSP
      insert_to_right {
        function()
          local msg = 'No Active Lsp'
          local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
          local clients = vim.lsp.get_clients()
          if next(clients) == nil then
            return msg
          end
          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
              return client.name
            end
          end
          return msg
        end,
        icon = ' ',
        color = { fg = '#ffffff' },
      }

      -- Location
      insert_to_right {
        "location"
      }

      -- Progress bar.
      insert_to_right {
        function()
          local current_line = vim.fn.line(".")
          local total_lines = vim.fn.line("$")
          local icons = { "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" }

          local line_ratio = current_line / total_lines

          local index = math.ceil(line_ratio * #icons)

          return icons[index] .. icons[index]
        end,
        color = {
          fg = colors.blue,
        },
        padding = { left = 0, right = 0 },
      }

      return sects
    end)(),
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
  },
}
