local map = vim.keymap.set

vim.g.leader = "<Space>"

-- Toggle auto-indenting for code paste
map('n', '<F2>', ':set invpaste paste?<CR>')
vim.opt.pastetoggle = '<F2>'
