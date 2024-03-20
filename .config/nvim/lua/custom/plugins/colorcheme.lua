return {
    "folke/tokyonight.nvim",
    lazy = false,
    priorty = 100,
    config = function()
        vim.cmd [[colorscheme tokyonight-night]]
    end
}
