-- formatter
local M = { "stevearc/conform.nvim" }

M.event = {
    "BufReadPre",
    "BufNewFile"
}

M.config = function()
    local conform = require("conform")

    conform.setup({
        format_on_save = {
            async = false,
            timeout_ms = 500,
            lsp_fallback = true,
        },
        formatters_by_ft = {
            -- https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
            -- Conform will run multiple formatters sequentially
            -- Use a sub-table to run only the first available formatter
            python     = { "isort", "black" },
            go         = { "gofmt" },
            terraform  = { { "terraform_fmt", "hclfmt" } },
            yaml       = { "prettier" },
            json       = { "prettier" },
            javascript = { "prettier" },
            lua        = { "stylua" },
        }
    })

    vim.keymap.set(
        { "n", "v", },
        "<Leader>mp",
        function()
            conform.format({
                async = false,
                timeout_ms = 500,
                lsp_fallback = true,
            })
        end,
        { desc = "Make file Pretty" }
    )
end

return M
