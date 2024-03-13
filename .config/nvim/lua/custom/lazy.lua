require("lazy").setup(
    {
        { import = "custom.plugins" },
        { import = "custom.plugins.lsp" }
    },
    {
        checker = {
            enabled = true,
            notify = true
        },
        change_detection = {
            notify = true
        }
    }
)
