-- html and js auto tags
return {
    "windwp/nvim-ts-autotag",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require('nvim-ts-autotag').setup({
            filetypes = { "html", "xml" },
        })
    end
}
