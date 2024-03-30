-- auto insert closing chars
return {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    config = function()
        local apairs = require('nvim-autopairs')
        apairs.setup({
            disable_filetype = {
                "TelescopePrompt",
                "spectre_panel",
                "html",
                "xml",
            }
        })
    end
}
