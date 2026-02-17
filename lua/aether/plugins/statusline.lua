local hl = require('aether.utils.colorscheme')

local function build_colors()
    return {
        modes = {
            -- Normal
            n = {
                mode = 'NORMAL',
                fg = hl.get_hl('Function').fg or '#5f87af',
                bg = hl.get_hl('Function').bg or '#1c1c1c1',
            }, -- dusty blue
            no = {
                mode = 'OPERATOR',
                fg = hl.get_hl('Function').fg or '#5f87af',
                bg = hl.get_hl('Function').bg or '#1c1c1c1',
            },

            -- Insert
            i = {
                mode = 'INSERT',
                fg = hl.get_hl('String').fg or '#6a9955',
                bg = hl.get_hl('String').bg or '#1c1c1c1',
            }, -- muted green
            ic = {
                mode = 'INSERT',
                fg = hl.get_hl('String').fg or '#6a9955',
                bg = hl.get_hl('String').bg or '#1c1c1c1',
            },
            ix = {
                mode = 'INSERT',
                fg = hl.get_hl('String').fg or '#6a9955',
                bg = hl.get_hl('String').bg or '#1c1c1c1',
            },

            -- Visual
            v = {
                mode = 'VISUAL',
                fg = hl.get_hl('Keyword').fg or '#875f87',
                bg = hl.get_hl('Keyword').bg or '#1c1c1c1',
            }, -- faded purple
            V = {
                mode = 'V-LINE',
                fg = hl.get_hl('Keyword').fg or '#875f87',
                bg = hl.get_hl('Keyword').bg or '#1c1c1c1',
            },
            [''] = {
                mode = 'V-BLOCK',
                fg = hl.get_hl('Keyword').fg or '#875f87',
                bg = hl.get_hl('Keyword').bg or '#1c1c1c1',
            },

            -- Select
            s = {
                mode = 'SELECT',
                fg = hl.get_hl('Keyword').fg or '#5f8787',
                bg = hl.get_hl('Keyword').bg or '#1c1c1c1',
            }, -- dusty teal
            S = {
                mode = 'S-LINE',
                fg = hl.get_hl('Keyword').fg or '#5f8787',
                bg = hl.get_hl('Keyword').bg or '#1c1c1c1',
            },
            [''] = {
                mode = 'S-BLOCK',
                fg = hl.get_hl('Keyword').fg or '#5f8787',
                bg = hl.get_hl('Keyword').bg or '#1c1c1c1',
            },

            -- Replace
            R = {
                mode = 'REPLACE',
                fg = hl.get_hl('DiagnosticError').fg or '#af5f5f',
                bg = hl.get_hl('DiagnosticError').bg or '#1c1c1c1',
            }, -- muted red
            Rv = {
                mode = 'V-REPLACE',
                fg = hl.get_hl('DiagnosticError').fg or '#af5f5f',
                bg = hl.get_hl('DiagnosticError').bg or '#1c1c1c1',
            },

            -- Command
            c = {
                mode = 'COMMAND',
                fg = hl.get_hl('Identifier').fg or '#af875f',
                bg = hl.get_hl('Identifier').bg or '#1c1c1c1',
            }, -- soft amber
            cv = {
                mode = 'VIM EX',
                fg = hl.get_hl('Identifier').fg or '#af875f',
                bg = hl.get_hl('Identifier').bg or '#1c1c1c1',
            },
            ce = {
                mode = 'EX',
                fg = hl.get_hl('Identifier').fg or '#af875f',
                bg = hl.get_hl('Identifier').bg or '#1c1c1c1',
            },

            -- Terminal
            t = {
                mode = 'TERMINAL',
                fg = hl.get_hl('Constant').fg or '#5f5f87',
                bg = hl.get_hl('Constant').bg or '#1c1c1c1',
            }, -- deep muted indigo

            -- Prompt / misc
            r = {
                mode = 'PROMPT',
                fg = hl.get_hl('Special').fg or '#4f6f6f',
                bg = hl.get_hl('Special').bg or '#1c1c1c1',
            }, -- desaturated cyan
            rm = {
                mode = 'MORE',
                fg = hl.get_hl('Special').fg or '#4f6f6f',
                bg = hl.get_hl('Special').bg or '#1c1c1c1',
            },
            ['r?'] = {
                mode = 'CONFIRM',
                fg = hl.get_hl('Special').fg or '#4f6f6f',
                bg = hl.get_hl('Special').bg or '#1c1c1c1',
            },
        },
        git = {
            branch = {
                fg = hl.get_hl('Constant').fg or '#1c1c1c1',
                bg = hl.get_hl('Constant').bg or '#1c1c1c1',
            },
        },
        fg = hl.get_hl('Normal').fg or 'bcbcbc',
        bg = hl.get_hl('Normal').bg or '1c1c1c',
    }
end

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = function()
        local sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {},
        }

        local colors = build_colors()

        vim.api.nvim_create_autocmd('Colorscheme', {
            callback = function()
                colors = build_colors()
            end,
        })

        local function left(component)
            table.insert(sections.lualine_c, component)
        end

        local function right(component)
            table.insert(sections.lualine_x, component)
        end

        -- Modes
        left({
            function()
                local mode = vim.api.nvim_get_mode().mode
                local m = colors.modes[mode] or { 'UNKNOWN', '#444444' }
                return m.mode
            end,
            padding = { left = 1, right = 1 },
            color = function()
                local mode = vim.api.nvim_get_mode().mode
                local m = colors.modes[mode] or { bg = nil, fg = '#444444' }
                return { fg = m.fg, bg = m.bg, gui = 'bold' }
            end,
        })

        -- Filename
        left({
            'filename',
            path = 1, -- 0 = just name, 1 = relative, 2 = absolute
            symbols = {
                modified = ' ●',
                readonly = ' 󰌾',
                unnamed = '[No Name]',
            },
            color = { fg = colors.fg },
            cond = function()
                return vim.fn.winwidth(0) > 80
            end,
        })

        -- Branch
        left({
            'branch',
            icon = ' ',
            color = { fg = colors.git.branch.fg },
        })

        -- Diffs
        left({
            'diff',
            symbols = {
                added = ' +',
                modified = ' ~',
                removed = ' -',
            },
            diff_color = {
                added = { fg = '#6a9955' },
                modified = { fg = '#af875f' },
                removed = { fg = '#af5f5f' },
            },
            cond = function()
                return vim.fn.winwidth(0) > 80
            end,
        })

        -- Diagnostics
        right({
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = {
                error = ' ',
                warn = ' ',
                info = ' ',
                hint = '󰌵 ',
            },
            diagnostics_color = {
                error = { fg = '#af5f5f' },
                warn = { fg = '#af875f' },
                info = { fg = '#5f87af' },
                hint = { fg = '#5f8787' },
            },
        })

        -- LSP
        right({
            function()
                local clients = vim.lsp.get_active_clients({ bufnr = 0 })
                if #clients == 0 then
                    return 'No LSP'
                end
                return clients[1].name
            end,
            icon = ' ',
            color = { fg = colors.fg },
            cond = function()
                return vim.fn.winwidth(0) > 80
            end,
        })

        -- Position
        right({
            function()
                return string.format('%d:%d', vim.fn.line('.'), vim.fn.col('.'))
            end,
            color = { fg = colors.fg },
        })

        return {
            options = {
                globalstatus = true,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
            },
            sections = sections,
        }
    end,
}
