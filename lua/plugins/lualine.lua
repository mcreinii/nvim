return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        options = {
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
            globalstatus = true,
        },

        sections = (function()
            local sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            }

            local hl = require('helpers.hl')
            local mode_map = {
                n = { label = 'NORMAL', hl = 'String' },
                i = { label = 'INSERT', hl = 'Keyword' },
                v = { label = 'VISUAL', hl = 'Function' },
                V = { label = 'V-LINE', hl = 'Function' },
                ['\22'] = { label = 'V-BLOCK', hl = 'Function' },
                c = { label = 'COMMAND', hl = 'Special' },
                R = { label = 'REPLACE', hl = 'Error' },
            }
            local fg = hl.get_hl('String')

            local function left(component)
                table.insert(sections.lualine_c, component)
            end
            local function right(component)
                table.insert(sections.lualine_x, component)
            end

            left({
                function()
                    local mode = vim.fn.mode()
                    return (mode_map[mode] or {}).label or mode
                end,
                color = function()
                    local mode = vim.fn.mode()
                    local m = mode_map[mode] or {}
                    local colors = hl.get_hl(m.hl or 'Normal')

                    return {
                        fg = colors.bg or '#000000', -- invert for contrast
                        bg = colors.fg or '#ffffff',
                    }
                end,
            })

            left({
                'filename',
                file_status = true, -- show [+] for modified
                path = 1, -- relative path
                color = function()
                    local c = hl.get_hl('Directory')
                    return { fg = c.fg or '#ffffff', bg = c.bg, gui = 'bold' }
                end,
            })

            left({
                'diagnostics',
                diagnostics_color = {
                    error = hl.get_hl('DiagnosticError'),
                    warn = hl.get_hl('DiagnosticWarn'),
                    info = hl.get_hl('DiagnosticInfo'),
                    hint = hl.get_hl('DiagnosticHint'),
                },
                symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
                colored = true,
                update_in_insert = false,
            })

            right({
                'diff',
                symbols = { added = ' ', modified = ' ', removed = ' ' },
                color = function()
                    local c = hl.get_hl('DiffAdd')
                    return { fg = c.fg or '#a6e22e' }
                end,
            })

            right({
                function()
                    local branch = vim.fn.system('git branch --show-current | tr -d "\\n"')
                    if vim.v.shell_error == 0 then
                        return ' ' .. branch
                    else
                        return ''
                    end
                end,
                color = {
                    fg = fg,
                },
            })

            return sections
        end)(),
    },
}
