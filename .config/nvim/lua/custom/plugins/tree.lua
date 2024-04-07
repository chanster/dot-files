-- file tree
return {
    "nvim-tree/nvim-tree.lua",
    tag = "v1",
    config = function()
        local tree = require("nvim-tree")

        tree.setup({
            sync_root_with_cwd = true,
            view = ({
                width = 50,
                relativenumber = false,
            }),
            renderer = {
                indent_markers = {
                    enable = true
                },
                highlight_git = "icon",
                highlight_opened_files = "all",
                special_files = {
                    ".gitignore",
                    "Cargo.toml",
                    "Makefile", "Taskfile", "taskfile",
                    "README.md", "readme.md",
                },
            },
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                },
            },
        })

        vim.keymap.set("n", "<C-n>", vim.cmd.NvimTreeToggle, { desc = "Nvim Tree" })
    end
}
