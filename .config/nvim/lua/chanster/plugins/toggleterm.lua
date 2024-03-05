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
            display = "LazyGit"
        })
        function lazygit_toggle()
            lazygit:toggle()
        end
        -- lazydocker
        local lazydocker = require("toggleterm.terminal").Terminal:new({
            cmd = "lazydocker",
            hidden = false,
            dir = "git_dir",
            direction = "float",
            display = "LazyDocker"
        })
        function lazydocker_toggle()
            lazydocker:toggle()
        end
        -- k9s
        local k9s = require("toggleterm.terminal").Terminal:new({
            cmd = "k9s",
            hidden = false,
            dir = "git_dir",
            direction = "float",
            display = "k9s"
        })
        function k9s_toggle()
            k9s:toggle()
        end


        toggleterm.setup()

        vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Open Terminal" })
        vim.keymap.set("n", "<leader>gg", "<cmd>lua lazygit_toggle()<CR>", { desc = "Open LazyGit"})
        vim.keymap.set("n", "<leader>ld", "<cmd>lua lazydocker_toggle()<CR>", { desc = "Open LazyDocker"})
        vim.keymap.set("n", "<leader>k9", "<cmd>lua k9s_toggle()<CR>", { desc = "Open K9s"})
    end
}
