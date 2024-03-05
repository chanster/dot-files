return {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local map = vim.keymap.set

        map("n", "<Leader>gg", "<cmd>LazyGit<CR>", { desc = "Open LazyGit" })
    end
}
