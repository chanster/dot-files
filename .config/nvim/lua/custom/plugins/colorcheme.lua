-- theme
local M = { "folke/tokyonight.nvim" }

M.lazy = false
M.priorty = 100

M.config = function()
    vim.cmd('colorscheme tokyonight-night')
end

return M
