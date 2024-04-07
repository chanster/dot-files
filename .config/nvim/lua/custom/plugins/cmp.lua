local M = { "hrsh7th/nvim-cmp" }

M.dependencies = {
    "hrsh7th/cmp-buffer",           -- source for buffer words
    "hrsh7th/cmp-path",             -- source for filesystem paths
    "L3MON4D3/LuaSnip",             -- snippet engine
    "saadparwaiz1/cmp_luasnip",     -- luasnip source for cmp
    "rafamadriz/friendly-snippets", -- collection of snippets
    "onsails/lspkind.nvim"          -- pictograms for symbols
}

M.event = { "InsertEnter" }

M.config = function()
    local cmp = require("cmp")

    local lspkind = require("lspkind")
    local luasnip = require("luasnip")
    require("luasnip.loaders.from_vscode").lazy_load() -- load snippets from installe plugins

    local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    cmp.setup({
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        formatting = {
            format = lspkind.cmp_format({
                mode = 'symbol_text',      -- symbol_text, symbol, text, or text_symbol
                maxwidth = 50,
                ellipsis_char = '...',     -- when popup menu exceed maxwidth
                show_labelDetails = false, -- show labelDetails in menu. Disabled by default
            })
        },
        completion = {
            completionopt = "menu,menuone,preview,noselect",
        },
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end
        },
        mapping = cmp.mapping.preset.insert({
            ["<C-u>"]     = cmp.mapping.scroll_docs(-5),
            ["<C-d>"]     = cmp.mapping.scroll_docs(5),
            ["<C-Space>"] = cmp.mapping.complete(), -- manually open cmp
            ["<C-e>"]     = cmp.mapping.abort(),    -- close cmp modal
            ["<Esc>"]     = cmp.mapping.abort(),    -- close cmp modal
            ["<Tab>"]     = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.confirm({ select = true })
                    -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                    -- that way you will only jump inside the snippet region
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end),
            ["<S-Tab>"]   = cmp.mapping(function(fallback)
                if luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end),
        }),
        sources = cmp.config.sources({
            { name = "nvim_lsp" }, -- lsp auto completions
            { name = "luasnip" },  -- luasnip snippets
            { name = "buffer" },   -- current open buffer
            { name = "path" },     -- filesystem paths
        }),
    })
end

return M
