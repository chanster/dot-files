return {
    "jay-babu/mason-nvim-dap.nvim",
    dependencides = {
        "williamboman/mason.nvim",
        "mfussenegger/nvim-dap",
    },
    config = function()
        local masondap = require("mason-nvim-dap")

        masondap.setup({
            ensure_installed = {},
            automatic_installation = true,
            handlers = {
                function(config)
                    masondap.default_setup(config)
                end
            },
        })
    end
}

