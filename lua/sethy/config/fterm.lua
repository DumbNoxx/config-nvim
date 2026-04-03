local status, fterm = pcall(require, "FTerm")

if not status then
    return
end

fterm.setup({
    dimensions = {
        height = 0.8,
        width = 0.8,
        x = 0.5,
        y = 0.5,
    },
    border = "rounded",
})


vim.keymap.set('n', '<leader>ft', '<CMD>lua require("FTerm").toggle()<CR>', { desc = 'Toggle FTerm' })
vim.keymap.set('n', '<leader>FT', '<CMD>lua require("FTerm").toggle(true)<CR>', { desc = 'Toggle FTerm (force new)' })
