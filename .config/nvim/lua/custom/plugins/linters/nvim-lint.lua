-- linters
-- install Linters with :Mason
-- add non-LSP linters here
return {
    "mfussenegger/nvim-lint",
    event = {
        "BufReadPre",
        "BufNewFile",
        "InsertLeave",
    },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            -- https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd(
            { "BufEnter", "BufWritePost", "InsertLeave", },
            {
                group = lint_augroup,
                callback = function()
                    lint.try_lint()
                end
            }
        )
    end
}
