local status, cmp = pcall(require, "cmp")

if not status then
    return
end
local status_snip, luasnip = pcall(require, "luasnip")

cmp.setup({
    snippet = {
        expand = function(args)
            if status_snip then
                luasnip.lsp_expand(args.body)
            end
        end
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
    }, {
        { name = "buffer" },
        { name = "path" },
    }),
})
