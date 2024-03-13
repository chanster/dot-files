return {
    "akinsho/bufferline.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        local bufferline = require("bufferline")

        bufferline.setup({
            options = {
                always_show_bufferline = true,
                seperator_style = { "slant", "slope", "thin" },
            }
        })
    end
}
