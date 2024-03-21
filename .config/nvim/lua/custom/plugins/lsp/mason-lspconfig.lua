return {
    "williamboman/mason-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
    },
    config = function()
        local mason_lspconfig = require("mason-lspconfig")

        mason_lspconfig.setup({
            ensure_installed = {},
            automatic_installation = true,
        })
    end
}
