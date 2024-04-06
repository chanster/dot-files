-- auto insert closing chars
return {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    config = function()
        local apairs = require('nvim-autopairs')

        apairs.setup({
            check_ts = true,                  -- enable treesitter
            enable_check_bracket_line = true, -- check for closing bracket
            fast_wrap = {},
            disable_filetype = {
                "TelescopePrompt",
                "spectre_panel",
                "html",
                "xml",
            }
        })
    end
}
