return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "nvim-telescope/telescope.nvim",
        "williamboman/mason-lspconfig",
        { "antosha417/nvim-lsp-file-operations", config = true }, -- update file references on rename
        "folke/which-key.nvim",
    },
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    config = function()
        local lspconfig = require("lspconfig")
        local telescope = require("telescope.builtin")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local capabilities = cmp_nvim_lsp.default_capabilities() -- enable autocompletion for language servers
        local wk = require("which-key")

        wk.register({
            ["<leader>g"] = {
                name = "LSP...",
            }
        })

        -- load keybindings on lsp buffer
        local opts = { noremap = true, silent = true }
        local on_attach = function(_, bufnr)
            opts.buffer = bufnr

            local map = vim.keymap.set

            -- set keybinds
            opts.desc = "Show LSP references"
            map("n", "<leader>gR", telescope.lsp_references, opts)                 -- show definition, references
            opts.desc = "Show LSP definitions"
            map("n", "<leader>gd", telescope.lsp_definitions, opts)                -- show lsp definitions
            opts.desc = "Show LSP implementations"
            map("n", "<leader>gi", telescope.lsp_implementations, opts)            -- show lsp implementations
            opts.desc = "Show LSP type definitions"
            map("n", "<leader>gt", telescope.lsp_type_definitions, opts)           -- show lsp type definitions
            opts.desc = "Restart LSP"
            map("n", "<leader>gR", "<cmd>LspRestart<CR>", opts)                    -- mapping to restart lsp if necessary
            opts.desc = "Show buffer diagnostics"
            map("n", "<leader>gg", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

            -- vim lsp enhanced with telescope
            opts.desc = "See available code actions"
            map({ "n", "v" }, "<leader>gc", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
            opts.desc = "Smart rename"
            map("n", "<leader>rn", vim.lsp.buf.rename, opts)               -- smart rename
            opts.desc = "Go to declaration"
            map("n", "<leader>gD", vim.lsp.buf.declaration, opts)          -- go to declaration
            opts.desc = "Show line diagnostics"
            map("n", "<leader>gd", vim.diagnostic.open_float, opts)        -- show diagnostics for line
            opts.desc = "Go to previous diagnostic"
            map("n", "[d", vim.diagnostic.goto_prev, opts)                 -- jump to previous diagnostic in buffer
            opts.desc = "Go to next diagnostic"
            map("n", "]d", vim.diagnostic.goto_next, opts)                 -- jump to next diagnostic in buffer
            opts.desc = "Show documentation for what is under cursor"
            map("n", "<leader>K", vim.lsp.buf.hover, opts)                 -- show documentation for what is under cursor
        end

        -- Change the Diagnostic symbols
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        -- bash
        lspconfig["bashls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- yaml
        lspconfig["yamlls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- json
        lspconfig["jsonls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- markdown
        lspconfig["marksman"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- python
        lspconfig["ruff_lsp"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            init_options = {
                settings = {
                    args = {},
                },
            },
        })
        lspconfig["pylsp"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
        lspconfig["pyright"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- terraform
        lspconfig["terraformls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
        lspconfig["tflint"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- golang
        lspconfig["gopls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- lua
        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = { -- custom settings for lua
                Lua = {
                    -- make the language server recognize "vim" global
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        -- make language server aware of runtime files
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })
    end
}
