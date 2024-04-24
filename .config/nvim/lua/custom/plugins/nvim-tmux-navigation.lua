-- seamless tmux window pane navigation
local M = { "alexghergh/nvim-tmux-navigation" }

M.config = function()
    local tnav = require("nvim-tmux-navigation")
    local map = vim.keymap.set

    tnav.setup({
        disable_when_zoomed = true
    })

    map('n', "<C-h>", tnav.NvimTmuxNavigateLeft, { desc = "Go to Left Pane" })
    map('n', "<C-j>", tnav.NvimTmuxNavigateDown, { desc = "Go to Down Pane" })
    map('n', "<C-k>", tnav.NvimTmuxNavigateUp, { desc = "Go to Up Pane" })
    map('n', "<C-l>", tnav.NvimTmuxNavigateRight, { desc = "Go to Right Pane" })
    map('n', "<C-Left>", tnav.NvimTmuxNavigateLeft, { desc = "Go to Left Pane" })
    map('n', "<C-Down>", tnav.NvimTmuxNavigateDown, { desc = "Go to Down Pane" })
    map('n', "<C-Up>", tnav.NvimTmuxNavigateUp, { desc = "Go to Up Pane" })
    map('n', "<C-Right>", tnav.NvimTmuxNavigateRight, { desc = "Go to Right Pane" })
end

return M
