return {
    "mfussenegger/nvim-dap",
    dependecies = {
        "folke/which-key.nvim",
    },
    config = function()
        local dap = require("dap")
        local vscode = require("dap.ext.vscode")
        local wk = require("which-key")
        local map = vim.keymap.set

        wk.register({
            ["<leader>d"] = {
                name = "Debug...",
            }
        })

        map("n", "<F5>", function() dap.continue() end, { desc = "Debug: Start" })
        map("n", "<F10>", function() dap.step_over() end, { desc = "Step over" })
        map("n", "<F11>", function() dap.step_into() end, { desc = "Step Into" })
        map("n", "<F12>", function() dap.step_out() end, { desc = "Step out" })
        map("n", "<Leader>db", function() dap.toggle_breakpoint() end, { desc = "Toggle breakpoint" })
        map("n", "<Leader>dB", function() dap.set_breakpoint() end, { desc = "Set breakpoint" })
        map("n", "<Leader>dp", function() dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end,
            { desc = "Create Log breakpoint" })
        map("n", "<Leader>dr", function() dap.repl.open() end, { desc = "Open a REPL / Debug-console" })
        map("n", "<Leader>dl", function() dap.run_last() end, { desc = "Re-run last debugger adapter" })
    end
}
