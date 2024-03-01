return {
    "nvim-tree/nvim-tree.lua",
    tag = "v1",
    config = function()
        local tree = require("nvim-tree")

        tree.setup({
            view = ({
                relativenumber = true,
            }),
            renderer = {
                indent_markers = {
                    enable = true
                }
            }
        })

        vim.keymap.set("n", "<C-b>", vim.cmd.NvimTreeToggle)
    end
}
