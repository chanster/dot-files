vim.opt.termguicolors = true -- enable clolors


vim.opt.hidden = true -- aollow buffer swap without saving
vim.opt.number = true -- enable number line

vim.opt.tabstop     = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth  = 4
vim.opt.expandtab   = true -- expand tabs to spaces

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup   = false
vim.opt.undodir  = os.getenv("HOME") .. "/.local/nvim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.colorcolumn = "80"
