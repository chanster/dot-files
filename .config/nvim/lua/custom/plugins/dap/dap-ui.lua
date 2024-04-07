local M = { "rcarriga/nvim-dap-ui" }

M.dependencies = {
    "mfussenegger/nvim-dap", -- dap client
    "nvim-neotest/nvim-nio"  -- async library
}

M.config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local map = vim.keymap.set

    dapui.setup()

    dap.listeners.before.attach.dapui_config = function()
        dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
        dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
    end

    map({ "n" }, "<leader>du", function() require("dapui").toggle({}) end, { desc = "[D]AP [U]I toggle" })
    map({ "n", "v" }, "<leader>de", function() require("dapui").eval() end,
        { desc = "[D]AP UI [E]valuate expression" })
end

return M
