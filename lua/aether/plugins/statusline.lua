return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = function()
        local palette = require('koda').get_palette()
        local sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {},
        }

        local function left(component)
            table.insert(sections.lualine_c, component)
        end

        local function right(component)
            table.insert(sections.lualine_x, component)
        end

        -- Modes
        local modes = {
            -- Normal
            n = { 'NORMAL', '#5f87af' }, -- dusty blue
            no = { 'OPERATOR', '#5f87af' },

            -- Insert
            i = { 'INSERT', '#6a9955' }, -- muted green
            ic = { 'INSERT', '#6a9955' },
            ix = { 'INSERT', '#6a9955' },

            -- Visual
            v = { 'VISUAL', '#875f87' }, -- faded purple
            V = { 'V-LINE', '#875f87' },
            [''] = { 'V-BLOCK', '#875f87' },

            -- Select
            s = { 'SELECT', '#5f8787' }, -- dusty teal
            S = { 'S-LINE', '#5f8787' },
            [''] = { 'S-BLOCK', '#5f8787' },

            -- Replace
            R = { 'REPLACE', '#af5f5f' }, -- muted red
            Rv = { 'V-REPLACE', '#af5f5f' },

            -- Command
            c = { 'COMMAND', '#af875f' }, -- soft amber
            cv = { 'VIM EX', '#af875f' },
            ce = { 'EX', '#af875f' },

            -- Terminal
            t = { 'TERMINAL', '#5f5f87' }, -- deep muted indigo

            -- Prompt / misc
            r = { 'PROMPT', '#4f6f6f' }, -- desaturated cyan
            rm = { 'MORE', '#4f6f6f' },
            ['r?'] = { 'CONFIRM', '#4f6f6f' },
        }

        left({
            function()
                local mode = vim.api.nvim_get_mode().mode
                local m = modes[mode] or { 'UNKNOWN', '#444444' }
                return m[1]
            end,
            padding = { left = 1, right = 1 },
            color = function()
                local mode = vim.api.nvim_get_mode().mode
                local m = modes[mode] or { nil, '#444444' }
                return { fg = '#1c1c1c', bg = m[2] }
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
            color = { fg = '#bcbcbc' },
            cond = function()
                return vim.fn.winwidth(0) > 80
            end,
        })

        -- Branch
        left({
            'branch',
            icon = ' ',
            color = { fg = '#6a9955' },
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
            cond = function()
                return vim.fn.winwidth(0) > 80
            end,
        })

        -- Position
        right({
            function()
                return string.format('%d:%d', vim.fn.line('.'), vim.fn.col('.'))
            end,
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
