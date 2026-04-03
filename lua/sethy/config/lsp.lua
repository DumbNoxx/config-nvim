local status_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
local capabilites = status_cmp and cmp_lsp.default_capabilities() or {}

local status_lazy, lazy_lsp = pcall(require, "lazy-lsp")

if not status_lazy then
    return
end

lazy_lsp.setup({
    use_vim_lsp_config = true,
    default_config = {
        capabilities = capabilites,
    },
    configs = {
        vtsls = {},
        vue_ls = {
            init_options = {
                vue = {
                    hybridMode = false,
                },
            },
        },
    },
})
