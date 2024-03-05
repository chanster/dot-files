vim.g.mapleader = " " -- update <Leader>

local map = vim.keymap.set
-- Toggle auto-indenting for code paste
map("n", "<F2>", ":set invpaste paste?<CR>", { desc = "toggle indenting"})

-- buffer
map("n", "<C-[>", "<cmd>bp<CR>", { desc = "Load Previous Buffer" })
map("n", "<C-]>", "<cmd>bn<CR>", { desc = "Load Next Buffer" })
