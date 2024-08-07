local M = { "nvim-telescope/telescope.nvim", tag = "0.1.6" }

M.dependencies = {
    "nvim-lua/plenary.nvim", -- window modal
    "nvim-tree/nvim-web-devicons",
    "folke/which-key.nvim",
}

M.config = function()
    local telescope = require("telescope")
    -- local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")
    local opts = { noremap = true, silent = true }
    local wk = require("which-key")
    local map = vim.keymap.set

    telescope.setup({
        defaults = {
            path_display = { "truncate" },
            layout_strategy = "horizontal",
            layout_config = {
                prompt_position = "top",
            },
            sorting_strategy = "ascending",
        },
    })

    wk.add({
        "<leader>f", group = "Find...",
    })

    opts.desc = "Find File"
    map("n", "<leader>ff", builtin.find_files, opts)
    opts.desc = "Find File (include hidden)"
    map("n", "<leader>fF",
        function() builtin.find_files({ hidden = true, file_ignore_patterns = { ".git/" } }) end,
        opts)
    opts.desc = "Open Recent File"
    map("n", "<leader>fr", builtin.oldfiles, opts)
    opts.desc = "Live Grep"
    map("n", "<leader>fg", builtin.live_grep, opts)
    opts.desc = "Live Grep (include hidden)"
    map("n", "<leader>fG",
        function() builtin.live_grep({ additional_args = { "--hidden", "--glob=!**/.git/*" } }) end,
        opts)
    opts.desc = "Find in Buffer"
    map("n", "<leader>fb", builtin.buffers, opts)
    opts.desc = "Help Tags"
    map("n", "<leader>ft", builtin.help_tags, opts)
    opts.desc = "Keymaps"
    map("n", "<leader>fk", builtin.keymaps, opts)
end

return M
