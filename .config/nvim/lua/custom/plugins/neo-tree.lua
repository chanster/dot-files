local M = { "https://github.com/nvim-neo-tree/neo-tree.nvim", branch = "v3.x" }

M.dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "nvim-treesitter/nvim-treesitter", -- document_symbol uses tree-sitter
}

M.config = function()
    local neotree = require("neo-tree")

    neotree.setup({
        sources = {
            "filesystem",
            "buffers",
            "git_status",
            "document_symbols",
        },
        source_selector = {
            winbar = true,
            statusline = false,
            sources = { -- table
                {
                    source = "filesystem", -- string
                    display_name = " 󰙅 " -- string | nil
                },
                {
                    source = "buffers", -- string
                    display_name = " 󰈚 " -- string | nil
                },
                {
                    source = "document_symbols",
                    display_name = "  󰊕󰫧 "
                },
                {
                    source = "git_status", -- string
                    display_name = " 󰊢  " -- string | nil
                },
            },
        },
        close_if_last_window = true,
        popup_border_style = "rounded", -- "double", "none", "rounded", "shadow", "single" or "solid"
        enable_git_status = true,
        window = {
            position = "left",
            width = 50,
        },
        filesystem = {
            filtered_items = {
                visible = false, -- when true, they will just be displayed differently than normal items
                hide_gitignored = true,
                hide_by_name = {
                    "node_modules"
                },
                hide_by_pattern = {       -- uses glob style patterns
                },
                always_show = {           -- remains visible even if other settings would normally hide it
                },
                never_show = {            -- remains hidden even if visible is toggled to true, this overrides always_show
                },
                never_show_by_pattern = { -- uses glob style patterns
                },
            },
        },
        buffers = {
            follow_current_file = {
                enabled = true,          -- This will find and focus the file in the active buffer every time
                leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
            },
            group_empty_dirs = true,     -- when true, empty folders will be grouped together
            show_unloaded = true,
        },
        git_status = {
            window = {
                position = "float",
            }
        }
    })

    vim.keymap.set({ "n", "i" }, "<C-n>", ":Neotree toggle<CR>", { desc = "NeoTree" })
end


return M
