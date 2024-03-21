require("lazy").setup(
    {
        { import = "custom.plugins" },
        { import = "custom.plugins.lsp" },
        { import = "custom.plugins.linters" },
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
