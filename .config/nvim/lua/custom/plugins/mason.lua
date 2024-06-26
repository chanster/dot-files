-- LSP, DAP, Formatter manager
local M = { "williamboman/mason.nvim" }

M.config = function()
    local mason = require("mason")

    mason.setup({
        ui = {
            icons = {
                package_installed   = "✓",
                package_pending     = "→",
                package_uninstalled = "✗",
            }
        }
    })
end

return M
