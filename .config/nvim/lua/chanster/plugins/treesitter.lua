return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            ensure_installed = {
                "lua",
                "python",
                "go",
                "javascript",
                "typescript",
                "vim",
                "vimdoc",
            },
            sync_install = false,
            -- enable syntax hightlighting
            highlight = { enable = true },
            -- enable indentation
            indent = { enable = true },
        })
    end
}
