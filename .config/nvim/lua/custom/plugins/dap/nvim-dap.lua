local M = { "mfussenegger/nvim-dap" }

M.dependecies = {
    "folke/which-key.nvim",
}

M.config = function()
    local dap = require("dap")
    local wk = require("which-key")
    local map = vim.keymap.set

    wk.register({
        ["<leader>d"] = {
            name = "[D]ebug...",
        }
    })

    map("n", "<leader>ds", function() dap.continue() end, { desc = "[d]ebug: [s]tart" })
    map("n", "<leader>do", function() dap.step_over() end, { desc = "[d]ebug: step [o]ver" })
    map("n", "<F10>", function() dap.step_over() end, { desc = "[d]ebug: step [o]ver" })
    map("n", "<leader>di", function() dap.step_into() end, { desc = "[d]ebug: Step [i]nto" })
    map("n", "<F11>", function() dap.step_into() end, { desc = "[d]ebug: step [i]nto" })
    map("n", "<leaer>dt", function() dap.step_out() end, { desc = "[d]ebug: step Ou[t]" })
    map("n", "<F12>", function() dap.step_out() end, { desc = "[d]ebug: step ou[t]" })
    map("n", "<Leader>db", function() dap.toggle_breakpoint() end, { desc = "[d]ebug: toggle [b]reakpoint" })
    map("n", "<Leader>dB", function() dap.set_breakpoint() end, { desc = "[d]ebug: set [B]reakpoint" })
    map("n", "<Leader>dp", function() dap.set_breakpoint(nil, nil, vim.fn.input("log breakpoint message: ")) end,
        { desc = "[d]ebug: create log break[p]oint" })
    map("n", "<Leader>dl", function() dap.run_last() end, { desc = "[d]ebug: Re-run [l]ast adapter" })
end

return M
