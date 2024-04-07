local M = { "mfussenegger/nvim-dap-python" }

M.dependencies = {
    "mfussenegger/nvim-dap"
}

M.config = function()
    local dap_python = require("dap-python")

    -- adapter
    dap_python.setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")


    dap_python.resolve_python = function()
        -- try to locate python

        -- activated virtual env
        local venv_path = os.getenv('VIRTUAL_ENV')
        if venv_path then
            vim.notify("Found python in " .. venv_path, vim.log.levels.INFO, { title = "DAP Python" })
            return venv_path .. "/bin/python"
        end
        -- conda
        venv_path = os.getenv("CONDA_PREFIX")
        if venv_path then
            vim.notify("Found python in " .. venv_path, vim.log.levels.INFO, { title = "DAP Python" })
            return venv_path .. '/bin/python'
        end
        local venv
        for _, folder in ipairs({ "venv", ".venv", "env", ".env" }) do
            venv_path = vim.fn.getcwd() .. "/" .. folder
            local stat = vim.loop.fs_stat(venv_path)
            if stat and stat.type == "directory" then
                vim.notify("Found python in " .. venv_path, vim.log.levels.INFO, { title = "DAP Python" })
                return venv_path .. "/bin/python"
            end
        end
        -- not found
        vim.notify("unable to locate python for debugging", vim.log.levels.ERROR, { title = "DAP Python" })
        return -1
    end
end

return M
