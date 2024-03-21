return {
    "norcalli/nvim-colorizer.lua",
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
