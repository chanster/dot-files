local M = { "debugloop/telescope-undo.nvim" }

M.dependencies = {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
}

M.keys = {
    {     -- lazy style key map
        "<leader>u",
        "<cmd>Telescope undo<cr>",
        desc = "Undo history",
    },
}

M.opts = {
    extensions = {
        undo = {
            side_by_side = true,
            layout_strategy = "vertical",
            layout_config = {
                preview_height = 0.7,
            },
        },
    },
}

M.config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("undo")
end

return M
