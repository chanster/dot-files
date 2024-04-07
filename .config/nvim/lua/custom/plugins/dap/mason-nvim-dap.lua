local M = { "jay-babu/mason-nvim-dap.nvim" }

M.dependencides = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",
}

M.config = function()
    local mason = require("mason")
    local mason_dap = require("mason-nvim-dap")

    mason.setup()
    mason_dap.setup({
        ensure_installed = {},
        automatic_installation = true,
        handlers = {
            -- default handler setup
            function(config)
                mason_dap.default_setup(config)
            end,
        },
    })
end

return M
