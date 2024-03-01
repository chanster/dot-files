require("lazy").setup(
    {
        { import = "chanster.plugins" },
        -- { import = "chanster.plugins.lsp" }
    },
    {
        checker = {
            enabled = true,
            notify = true
        },
        change_detection = {
            notify = false
        }
    }
)
