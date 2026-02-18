local hl = require('aether.utils.colorscheme')

local function build_colors()
    local normal_bg = hl.get_hl('Normal').bg

    return {
        modes = {
            n = { mode = 'NORMAL', fg = hl.get_hl('Function').fg, bg = normal_bg },
            no = { mode = 'OPERATOR', fg = hl.get_hl('Function').fg, bg = normal_bg },

            i = { mode = 'INSERT', fg = hl.get_hl('String').fg, bg = normal_bg },
            ic = { mode = 'INSERT', fg = hl.get_hl('String').fg, bg = normal_bg },
            ix = { mode = 'INSERT', fg = hl.get_hl('String').fg, bg = normal_bg },

            v = { mode = 'VISUAL', fg = hl.get_hl('Keyword').fg, bg = normal_bg },
            V = { mode = 'V-LINE', fg = hl.get_hl('Keyword').fg, bg = normal_bg },
            [''] = { mode = 'V-BLOCK', fg = hl.get_hl('Keyword').fg, bg = normal_bg },

            s = { mode = 'SELECT', fg = hl.get_hl('Keyword').fg, bg = normal_bg },
            S = { mode = 'S-LINE', fg = hl.get_hl('Keyword').fg, bg = normal_bg },
            [''] = { mode = 'S-BLOCK', fg = hl.get_hl('Keyword').fg, bg = normal_bg },

            R = { mode = 'REPLACE', fg = hl.get_hl('DiagnosticError').fg, bg = normal_bg },
            Rv = { mode = 'V-REPLACE', fg = hl.get_hl('DiagnosticError').fg, bg = normal_bg },

            c = { mode = 'COMMAND', fg = hl.get_hl('Identifier').fg, bg = normal_bg },
            cv = { mode = 'VIM EX', fg = hl.get_hl('Identifier').fg, bg = normal_bg },
            ce = { mode = 'EX', fg = hl.get_hl('Identifier').fg, bg = normal_bg },

            t = { mode = 'TERMINAL', fg = hl.get_hl('Constant').fg, bg = normal_bg },

            r = { mode = 'PROMPT', fg = hl.get_hl('Special').fg, bg = normal_bg },
            rm = { mode = 'MORE', fg = hl.get_hl('Special').fg, bg = normal_bg },
            ['r?'] = { mode = 'CONFIRM', fg = hl.get_hl('Special').fg, bg = normal_bg },
        },
        git = {
            branch = { fg = hl.get_hl('Constant').fg, bg = normal_bg },
        },
        fg = hl.get_hl('Normal').fg,
        bg = normal_bg,
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

        vim.api.nvim_create_autocmd('ColorScheme', {
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
            color = { fg = colors.fg, bg = colors.bg },
            cond = function()
                return vim.fn.winwidth(0) > 80
            end,
        })

        -- Branch
        left({
            'branch',
            icon = ' ',
            color = { fg = colors.git.branch.fg, bg = colors.bg },
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
                added = { fg = '#6a9955', bg = colors.bg },
                modified = { fg = '#af875f', bg = colors.bg },
                removed = { fg = '#af5f5f', bg = colors.bg },
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
                error = { fg = '#af5f5f', bg = colors.bg },
                warn = { fg = '#af875f', bg = colors.bg },
                info = { fg = '#5f87af', bg = colors.bg },
                hint = { fg = '#5f8787', bg = colors.bg },
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
            color = { fg = colors.fg, bg = colors.bg },
            cond = function()
                return vim.fn.winwidth(0) > 80
            end,
        })

        -- Position
        right({
            function()
                return string.format('%d:%d', vim.fn.line('.'), vim.fn.col('.'))
            end,
            color = { fg = colors.fg, bg = colors.bg },
        })

        -- Time
        right({
            function()
                return os.date('%I:%M:%S')
            end,
            color = { fg = colors.fg, bg = colors.bg },
        })

        return {
            options = {
                globalstatus = true,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                theme = {
                    normal = {
                        c = { bg = colors.bg },
                        x = { bg = colors.bg },
                    },
                },
            },
            sections = sections,
        }
    end,
}
