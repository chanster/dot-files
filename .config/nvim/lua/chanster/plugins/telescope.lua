return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
        -- windowing
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")
        local map = vim.keymap.set

        telescope.setup({
            defaults = {
                path_display = { "tuncate" },
            }
        })

        map("n", "<Leader>ff", builtin.find_files, {})
        map("n", "<Leader>fr", builtin.oldfiles, {})
        map("n", "<Leader>fg", builtin.live_grep, {})
        map("n", "<Leader>fb", builtin.buffers, {})
        map("n", "<Leader>fh", builtin.help_tags, {})
    end
}
