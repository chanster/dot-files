local get_python_path = function()
    -- try to locate python

    -- activated virtual env
    local venv_path = os.getenv('VIRTUAL_ENV')
    if venv_path then
        return venv_path .. "/bin/python"
    end
    -- conda
    venv_path = os.getenv("CONDA_PREFIX")
    if venv_path then
        return venv_path .. '/bin/python'
    end
    -- local venv
    for _, folder in ipairs({ "venv", ".venv", "env", ".env" }) do
        local path = vim.fn.getcwd() .. "/" .. folder
        local stat = vim.loop.fs_stat(path)
        if stat and stat.type == "directory" then
            return path .. "/bin/python"
        end
    end
    -- mason installed
    venv_path = "~/.local/share/nvim/mason/packages/debugpy"
    if venv_path then
        return venv_path .. '/bin/python'
    end
    -- not found
    return nil
end

local M = { "jay-babu/mason-nvim-dap.nvim" }

M.dependencides = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",
}

M.config = function()
    local mason = require("mason")
    local mason_dap = require("mason-nvim-dap")

    mason.setup()
    mason_dap.setup({
        ensure_installed = {},
        automatic_installation = true,
        handlers = {
            function(config)
                mason_dap.default_setup(config)
            end,
            -- additional configs
            python = function(config)
                config.adapters = {
                    type = "executable",
                    file = "${file}",
                    command = get_python_path(),
                    args = {
                        "-m", "debugpy.adapter"
                    }
                }
                mason_dap.default_setup(config)
            end
        },
    })
end

return M
