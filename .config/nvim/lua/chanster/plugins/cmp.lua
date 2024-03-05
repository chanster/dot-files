return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer", -- source for buffer words
        "hrsh7th/cmp-path", -- source for filesystem paths
    },
    config = function()
        local cmp = require("cmp")

        cmp.setup({
            completion = {
                completionopt = "menu,menuone,preview,noselect",
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-Up>"]  = cmp.mapping.select_prev_item(),
                ["<C-Down>"] = cmp.mapping.select_next_item(),
                ["<C-[>"]    = cmp.mapping.scroll_docs(-5),
                ["<C-]>"]  = cmp.mapping.scroll_docs(5),
                ["<Tab>"]      = cmp.mapping.confirm({ select = false }),
                ["<C-Space>"] = cmp.mapping.complete(), -- manually open cmp
                ["<C-e>"]     = cmp.mapping.abort(), -- close cmp modal
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" }, -- lsp auto completions
                { name = "buffer" }, -- current open buffer
                { name = "path" }, -- filesystem paths
            }),
        })
    end
}

