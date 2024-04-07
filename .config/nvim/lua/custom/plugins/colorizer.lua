-- colorize HEX codes
local M = { "norcalli/nvim-colorizer.lua" }

M.event = {
    "BufNewFile",
    "BufReadPost",
}

M.config = function()
    local colorizer = require("colorizer")

    colorizer.setup({
        "css",
        "javascript",
        html = {
            names = false, -- don't parse color names like 'blue'
        }
    })
end

return M
