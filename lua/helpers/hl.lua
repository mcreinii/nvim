local M = {}

function M.get_hl(name)
    local hl = vim.api.nvim_get_hl(0, { name = name, link = false })
    return {
        fg = hl.fg and string.format('#%06x', hl.fg),
        bg = hl.bg and string.format('#%06x', hl.bg),
    }
end

return M
