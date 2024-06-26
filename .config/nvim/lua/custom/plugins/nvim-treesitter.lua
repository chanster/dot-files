-- parser generator
local M = { "nvim-treesitter/nvim-treesitter" }

M.build = ":TSUpdate"

M.event = { "BufReadPre", "BufNewFile" }

M.config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
        ensure_installed = {
            "comment",
            "markdown_inline",
            "regex",
            "lua",
            "vim",
            "vimdoc",
        },
        auto_install = true,  -- auto install parsers
        sync_install = false, -- parallel installs
        -- enable syntax hightlighting
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        -- enable indentation
        indent = { enable = true },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<C-space>",
                node_incremental = "<C-space>",
                node_decremental = "<bs>",
                scope_incremental = false,
            }
        }
    })
end

return M
