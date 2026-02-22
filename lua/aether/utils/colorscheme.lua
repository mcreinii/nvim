local M = {}

local function set_colors(groups, color)
    vim.api.nvim_set_hl(0, 'NotifyBackground', { bg = color == 'none' and '#000000' or color })

    for _, group in ipairs(groups) do
        vim.api.nvim_set_hl(0, group, { bg = color, ctermbg = color })
    end
end

M.groups = {
    'Normal',
    'NormalFloat',
    'FloatBorder',
    'SignColumn',
    'EndOfBuffer',
    'StatusLine',
    'StatusLineNC',
    'LineNr',
    'CursorLineNr',
    'Pmenu',
    'NeoTreeNormal',
    'NeoTreeNormalNC',
    'NeoTreeEndOfBuffer',
    'NeoTreeWinSeparator',
}

function M.setup_transparency()
    set_colors(M.groups, 'none')

    vim.api.nvim_create_autocmd('ColorScheme', {
        callback = function()
            set_colors(M.groups, 'none')
        end,
    })
end

function M.setup_black()
    set_colors(M.groups, '#000')

    vim.api.nvim_create_autocmd('ColorScheme', {
        callback = set_colors(M.groups, '#000'),
    })
end

function M.get_hl(name)
    local hl = vim.api.nvim_get_hl(0, { name = name })
    return {
        fg = hl.fg and string.format('#%06x', hl.fg) or nil,
        bg = hl.bg and string.format('#%06x', hl.bg) or nil,
    }
end

return M
