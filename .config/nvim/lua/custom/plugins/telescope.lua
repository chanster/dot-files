return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
        "nvim-lua/plenary.nvim", -- window modal
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local telescope = require("telescope")
        -- local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")
        local opts = { noremap = true, silent = true }
        local map = vim.keymap.set

        telescope.setup({
            defaults = {
                path_display = { "truncate" },
            }
        })

        opts.desc = "Find File"
        map("n", "<leader>ff", builtin.find_files, opts)
        opts.desc = "Open Recent File"
        map("n", "<leader>fr", builtin.oldfiles, opts)
        opts.desc = "Live Grep"
        map("n", "<leader>fg", builtin.live_grep, opts)
        opts.desc = "Find in Buffer"
        map("n", "<leader>fb", builtin.buffers, opts)
        opts.desc = "Help Tags"
        map("n", "<leader>ft", builtin.help_tags, opts)
    end
}
