return {
    "akinsho/toggleterm.nvim",
    config = function()
        local toggleterm = require("toggleterm")
        -- lazygit
        local lazygit = require("toggleterm.terminal").Terminal:new({
            cmd = "lazygit",
            hidden = false,
            dir = "git_dir",
            direction = "float",
            display = "LazyGit",
        })
        function Toggle_lazygit()
            lazygit:toggle()
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
            lazydocker:toggle()
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
            k9s:toggle()
        end

        toggleterm.setup()

        vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm direction=float<CR>", { desc = "Open Terminal" })
        vim.keymap.set("n", "<leader>tg", "<cmd>lua Toggle_lazygit()<CR>", { desc = "Open LazyGit" })
        vim.keymap.set("n", "<leader>td", "<cmd>lua Toggle_lazydocker()<CR>", { desc = "Open LazyDocker" })
        vim.keymap.set("n", "<leader>tk", "<cmd>lua Toggle_k9s()<CR>", { desc = "Open K9s" })
    end
}
