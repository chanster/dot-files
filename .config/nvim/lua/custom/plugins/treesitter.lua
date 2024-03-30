-- parser generator
return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
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
        })
    end
}
