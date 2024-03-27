-- parser generator
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
            auto_install = true, -- auto install parsers
            sync_install = true, -- parallel installs
            -- enable syntax hightlighting
            highlight = { enable = true },
            -- enable indentation
            indent = { enable = true },
        })
    end
}
