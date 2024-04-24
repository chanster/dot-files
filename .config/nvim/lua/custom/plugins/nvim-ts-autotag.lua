-- html and js auto tags
local M = { "windwp/nvim-ts-autotag" }

M.dependencies = {
    "nvim-treesitter/nvim-treesitter",
}

M.config = function()
    require('nvim-ts-autotag').setup({
        filetypes = { "html", "xml" },
    })
end

return M
