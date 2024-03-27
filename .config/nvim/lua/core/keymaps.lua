vim.g.mapleader = " " -- update <Leader>

local map = vim.keymap.set
-- Toggle auto-indenting for code paste
map("n", "<F2>", ":set invpaste paste?<CR>", { desc = "toggle indenting" })

-- Toggle relative numbers
map({ "n", "v" }, "<C-r>",
    function()
        vim.cmd("set relativenumber!")
    end,
    { desc = "Toggle Line numbers" }
)
