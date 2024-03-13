return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer", -- source for buffer words
        "hrsh7th/cmp-path", -- source for filesystem paths
        "L3MON4D3/LuaSnip", -- snippet engine
        "saadparwaiz1/cmp_luasnip", -- luasnip source for cmp
        "rafamadriz/friendly-snippets", -- collection of snippets
    },
    config = function()
        local cmp = require("cmp")

        local luasnip = require("luasnip")
        require("luasnip.loaders.from_vscode").lazy_load() -- load snippets from installe plugins

        cmp.setup({
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
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
                ["<C-Up>"]    = cmp.mapping.select_prev_item(),
                ["<C-Down>"]  = cmp.mapping.select_next_item(),
                ["<C-[>"]     = cmp.mapping.scroll_docs(-5),
                ["<C-]>"]     = cmp.mapping.scroll_docs(5),
                ["<Tab>"]     = cmp.mapping.confirm({ select = false }),
                ["<C-Space>"] = cmp.mapping.complete(), -- manually open cmp
                ["<C-e>"]     = cmp.mapping.abort(), -- close cmp modal
            }),
            sources = cmp.config.sources({
                { name = "luasnip" }, -- ultisnip snippets
                { name = "nvim_lsp" }, -- lsp auto completions
                { name = "buffer" }, -- current open buffer
                { name = "path" }, -- filesystem paths
            }),
        })
    end
}

