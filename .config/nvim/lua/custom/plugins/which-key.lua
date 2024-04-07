-- keymap helper
local M = { "folke/which-key.nvim" }

M.init = function()
    vim.opt.timeout = true
    vim.opt.timeoutlen = 200
end

M.config = function()
    require("which-key").setup()

    vim.keymap.set("n", "<C-p>", ":WhichKey<CR>", { desc = "Open Which Key" })
end

return M
