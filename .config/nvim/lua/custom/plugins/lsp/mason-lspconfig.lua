return {
    "williamboman/mason-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
    },
    config = function()
        local mason_lspconfig = require("mason-lspconfig")

        mason_lspconfig.setup({
            ensure_installed = {
                "pyright", "ruff_lsp",
                "bashls",
                "terraformls", "tflint"
            },
            automatic_installation = true,
        })
    end
}
