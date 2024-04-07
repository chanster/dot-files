local M = { "akinsho/toggleterm.nvim" }

M.dependecies = {
    "folke/which-key.nvim",
}

M.config = function()
    local toggleterm = require("toggleterm")
    local wk = require("which-key")

    -- lazygit
    local lazygit = require("toggleterm.terminal").Terminal:new({
        cmd = "lazygit",
        hidden = false,
        dir = "git_dir",
        direction = "float",
        display = "LazyGit",
    })
    function Toggle_lazygit()
        if vim.fn.executable("lazygit") == 1 then
            lazygit:toggle()
        else
            print("unable to find laygit...is it installed?")
        end
    end

    -- lazydocker
    local lazydocker = require("toggleterm.terminal").Terminal:new({
        cmd = "lazydocker",
        hidden = false,
        dir = "git_dir",
        direction = "float",
        display = "LazyDocker",
    })
    function Toggle_lazydocker()
        if vim.fn.executable("lazydocker") == 1 then
            lazydocker:toggle()
        else
            print("unable to find laydocker...is it installed?")
        end
    end

    -- k9s
    local k9s = require("toggleterm.terminal").Terminal:new({
        cmd = "k9s",
        hidden = false,
        dir = "git_dir",
        direction = "float",
        display = "k9s",
    })
    function Toggle_k9s()
        if vim.fn.executable("k9s") == 1 then
            k9s:toggle()
        else
            print("unable to find k9s...is it installed?")
        end
    end

    toggleterm.setup()

    wk.register({
        ["<leader>t"] = {
            name = "Toggle Term...",
        }
    })

    vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm direction=float<CR>", { desc = "Open Terminal (float)" })
    vim.keymap.set("n", "<leader>tT", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Open Terminal" })
    vim.keymap.set("n", "<leader>tg", "<cmd>lua Toggle_lazygit()<CR>", { desc = "Open LazyGit" })
    vim.keymap.set("n", "<leader>td", "<cmd>lua Toggle_lazydocker()<CR>", { desc = "Open LazyDocker" })
    vim.keymap.set("n", "<leader>tk", "<cmd>lua Toggle_k9s()<CR>", { desc = "Open K9s" })
end

return M
