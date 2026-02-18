local M = {}

function M.setup_transparency()
    local function apply()
        local groups = {
            'Normal',
            'NormalFloat',
            'FloatBorder',
            'FloatTitle',
            'StatusLine',
            'StatusLineNC',
            'WinSeparator',
            'VertSplit',
            'SignColumn',
            'EndOfBuffer',
            'MsgArea',
            'MsgSeparator',
            'CursorLineNr',
            'LineNr',
            'FoldColumn',
            'Pmenu',
            'PmenuSbar',
            'PmenuThumb',
            'TabLine',
            'TabLineFill',
            'TabLineSel',
            'NeoTreeNormal',
            'NeoTreeNormalNC',
            'NeoTreeEndOfBuffer',
            'NeoTreeWinSeparator',
            'NeoTreeFloatBorder',
            'NeoTreeFloatTitle',
        }

        vim.api.nvim_set_hl(0, 'NotifyBackground', { bg = '#000000' })

        for _, group in ipairs(groups) do
            vim.api.nvim_set_hl(0, group, { bg = 'none', ctermbg = 'none' })
        end
    end

    vim.api.nvim_create_autocmd('ColorScheme', {
        callback = apply,
    })

    apply()
end

function M.get_hl(name)
    local hl = vim.api.nvim_get_hl(0, { name = name })
    return {
        fg = hl.fg and string.format('#%06x', hl.fg) or nil,
        bg = hl.bg and string.format('#%06x', hl.bg) or nil,
    }
end

return M
