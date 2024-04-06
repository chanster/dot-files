return {
    "mfussenegger/nvim-dap-python",
    dependencies = {
        "mfussenegger/nvim-dap",
    },
    config = function()
        local python_path = function()
            local venv_path = vim.fn.getcwd() .. ".venv"
            if vim.loop.fs_stat(venv_path) then
                return venv_path                       -- poetry, project env
            elseif os.getenv("VIRTUAL_VENV") then
                return os.getenv("VIRTUAL_VENV")       -- check if ENV set
            elseif os.getenv("CONDA_DEFAULT_PATH") then
                return os.getenv("CONDA_DEFAULT_PATH") -- check for base conda env
            else
                return ""
            end
        end

        require('dap-python').setup(python_path())
    end
}
