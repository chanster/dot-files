return {
    "debugloop/telescope-undo.nvim",
    dependencies = {
        {
            "nvim-telescope/telescope.nvim",
            dependencies = { "nvim-lua/plenary.nvim" },
        },
    },
    keys = {
        { -- lazy style key map
            "<leader>u",
            "<cmd>Telescope undo<cr>",
            desc = "Undo history",
        },
    },
    opts = {
        extensions = {
            undo = {
                side_by_side = true,
                layout_strategy = "vertical",
                layout_config = {
                    preview_height = 0.7,
                },
            },
        },
    },
    config = function(_, opts)
        require("telescope").setup(opts)
        require("telescope").load_extension("undo")
    end,
}
