-- buffer tabs
local M = { "akinsho/bufferline.nvim" }

M.dependencies = {
    "nvim-tree/nvim-web-devicons"
}

M.config = function()
    local bufferline = require("bufferline")

    bufferline.setup({
        options = {
            always_show_bufferline = true,
            seperator_style = { "slant", "slope", "thin" },
        }
    })
end

return M
