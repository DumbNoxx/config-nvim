local plugins = {
"https://github.com/zenbones-theme/zenbones.nvim",
    "https://github.com/dundalek/lazy-lsp.nvim",
    "https://github.com/windwp/nvim-autopairs",
    "https://github.com/hrsh7th/nvim-cmp",
    "https://github.com/numToStr/FTerm.nvim",
    "https://github.com/echasnovski/mini.files",
    "https://github.com/echasnovski/mini.icons",
    "https://github.com/DumbNoxx/pulse.nvim",
    "https://github.com/rktjmp/lush.nvim",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/hrsh7th/cmp-nvim-lsp",
    "https://github.com/hrsh7th/cmp-buffer",
    "https://github.com/hrsh7th/cmp-path",
    "https://github.com/L3MON4D3/LuaSnip",
    "https://github.com/saadparwaiz1/cmp_luasnip",
}

for _, repo in ipairs(plugins) do
    local status, err = pcall(function()
        vim.pack.add({ {src = repo} })
    end)

    if not status then
        vim.notify("loading error " .. repo .. ": " .. err, vim.log.levels.ERROR)
    end
end
require('sethy.config.colorscheme.zenbones')
require('sethy.config.icons')

require('sethy.config.cmp')

require('sethy.config.lsp')
require('sethy.config.autopairs')

require('sethy.config.files')
require('sethy.config.fterm')
require('sethy.config.pulse')


