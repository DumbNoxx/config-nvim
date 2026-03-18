return {
    "dundalek/lazy-lsp.nvim",
    dependencies = { "neovim/nvim-lspconfig", "hrsh7th/cmp-nvim-lsp", },
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        require("lazy-lsp").setup {
            use_vim_lsp_config = true,
             default_config = {
                capabilities = capabilities,
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
        }
    end
}
