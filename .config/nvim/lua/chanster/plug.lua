local vim = vim
local Plug = vim.fn["plug#"]

vim.call("plug#begin") -- start plugin list

-- shared plugins
Plug("nvim-tree/nvim-web-devicons")
Plug('nvim-lua/plenary.nvim')       -- ui components

-- colorscheme
Plug('catppuccin/vim', { ['as'] = 'catppuccin' })

-- fuzzy list
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.5' })


-- status bar
Plug("nvim-lualine/lualine.nvim")

vim.call("plug#end") -- end plugin list
