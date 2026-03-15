return {
    "dundalek/lazy-lsp.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
        require("lazy-lsp").setup {
            use_vim_lsp_config = true,
        }
    end
}
