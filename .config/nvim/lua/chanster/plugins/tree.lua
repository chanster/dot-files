return {
    "nvim-tree/nvim-tree.lua",
    tag = "v1",
    config = function()
        local tree = require("nvim-tree")

        tree.setup({
            view = ({
                width = 50,
                relativenumber = false,
            }),
            renderer = {
                icons = {
                    folder = {
                        enable = true,
                    },
                },
                indent_markers = {
                    enable = true
                },
                highlight_git = {
                    enable = "icon"
                },
                hightlight_opened_files = {
                    enable = true
                },
                special_files = {
                    ".gitignore",
                    "Cargo.toml",
                    "Makefile", "Taskfile", "taskfile",
                    "README.md", "readme.md",
                },
            }
        })

        vim.keymap.set("n", "<C-b>", vim.cmd.NvimTreeToggle)
    end
}
