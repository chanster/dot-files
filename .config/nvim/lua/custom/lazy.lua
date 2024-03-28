require("lazy").setup(
    {
        { import = "custom.plugins" },
        { import = "custom.plugins.lsp" },
        { import = "custom.plugins.dap" },
        { import = "custom.plugins.linters" },
    },
    {
        -- default {
        --   lazy = true
        -- },
        checker = {
            enabled = true,
            notify = true
        },
        change_detection = {
            enable = true,
            notify = false
        }
    }
)
