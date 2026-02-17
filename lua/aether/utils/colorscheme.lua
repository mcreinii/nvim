local M = {}

function M.get_hl(name)
    local hl = vim.api.nvim_get_hl(0, { name = name })
    return {
        fg = hl.fg and string.format('#%06x', hl.fg) or nil,
        bg = hl.bg and string.format('#%06x', hl.bg) or nil,
    }
end

return M
