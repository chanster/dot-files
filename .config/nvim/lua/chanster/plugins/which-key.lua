return {
    "folke/which-key.nvim",
    init = function()
        vim.opt.timeout = true
        vim.opt.timeoutlen = 200
    end,
    config = function()
        require("which-key").setup()
    end
}
