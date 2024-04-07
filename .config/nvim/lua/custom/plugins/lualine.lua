local M = { "nvim-lualine/lualine.nvim" }

M.dependencies = { "nvim-tree/nvim-web-devicons" }

M.config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    lualine.setup({
        options = {
            theme = "tokyonight"
        },
        sections = {
            lualine_x = {
                -- lazy.nvim update notification
                {
                    lazy_status.updates,
                    cond = lazy_status.has_updates,
                    color = { fg = "#ff9e64" },
                },
                { "encoding" },
                { "fileformat" },
                { "filetype" },
            },
        }
    })
end

return M
