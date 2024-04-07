-- adds indentation guides
local M = { "lukas-reineke/indent-blankline.nvim", main = "ibl" }

M.opts = {}

M.config = function()
    require("ibl").setup()
end

return M
