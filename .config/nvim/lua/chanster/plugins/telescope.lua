return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
        -- windowing
        "nvim-lua/plenary.nvim" 
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")
        local ms = vim.keymap.set

        telescope.setup({
            defaults = {
                path_display = { "tuncate" },
            }
        })

        ms('n', '<Leader>ff', builtin.find_files, {})
        ms('n', '<Leader>fg', builtin.live_grep, {})
        ms('n', '<Leader>fb', builtin.buffers, {})
        ms('n', '<Leader>fh', builtin.help_tags, {})
    end
}
