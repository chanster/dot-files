return {
    "norcalli/nvim-colorizer.lua",
    event = {
        "BufNewFile",
        "BufReadPost filettype=html,css,javascript,markdown.mdx",
    },
    config = function()
        local colorizer = require("colorizer")

        colorizer.setup({
            "css",
            "javascript",
            html = {
                names = false, -- don't parse color names like 'blue'
            }
        })
    end
}
