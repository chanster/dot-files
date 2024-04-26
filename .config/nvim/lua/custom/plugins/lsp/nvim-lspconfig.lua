return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp", -- auto completions
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
        local manson_lspconfig = require("mason-lspconfig")
        local capabilities = cmp_nvim_lsp.default_capabilities() -- enable autocompletion for language servers
        local map = vim.keymap.set
        local wk = require("which-key")

        wk.register({
            ["<leader>g"] = {
                name = "LSP...",
            }
        })

        -- load keybindings on lsp buffer
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("userLspConfig", {}),
            callback = function(event)
                local opts = { buffer = event.buf, silent = true }

                -- telescope
                opts.desc = "Show LSP references"
                map("n", "<leader>gR", telescope.lsp_references, opts)                 -- show definition, references
                opts.desc = "Show LSP definitions"
                map("n", "<leader>gd", telescope.lsp_definitions, opts)                -- show lsp definitions
                opts.desc = "Show LSP implementations"
                map("n", "<leader>gi", telescope.lsp_implementations, opts)            -- show lsp implementations
                opts.desc = "Show LSP type definitions"
                map("n", "<leader>gt", telescope.lsp_type_definitions, opts)           -- show lsp type definitions
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
                opts.desc = "Restart LSP"
                map("n", "<leader>gR", "<cmd>LspRestart<CR>", opts)            -- mapping to restart lsp if necessary
            end
        })

        -- Change the Diagnostic symbols
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        manson_lspconfig.setup_handlers({
            -- default handler for installed servers
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                })
            end,
            ["yamlls"] = function()
                -- yaml
                lspconfig["yamlls"].setup({
                    capabilities = capabilities,
                    settings = {
                        yaml = {
                            schemaStore = {
                                enable = true,
                            },
                            completions = true,
                        },
                    },
                })
            end,
            ["lua_ls"] = function()
                -- lua
                lspconfig["lua_ls"].setup({
                    capabilities = capabilities,
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
        })
    end
}
