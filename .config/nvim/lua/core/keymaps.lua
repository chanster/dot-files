vim.g.mapleader = " " -- update <Leader>

local map = vim.keymap.set
-- Toggle auto-indenting for code paste
map("n", "<F2>", ":set invpaste paste?<CR>", { desc = "toggle indenting" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- Toggle relative numbers
map({ "n", "v" }, "<C-n>",
    function()
        vim.cmd("set relativenumber!")
    end,
    { desc = "Toggle relative line numbers" }
)

map("n", "<C-s>", ":w<CR>", { desc = "Save File" })
map("i", "<C-s>", "<Esc>:w<CR>i", { desc = "Save File" })

-- move buffers
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
