local opts = {noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Paste witout replacing clipboard content
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste witout replacing clipboard content" })

-- Delete without copy in clipboard content
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]], { desc = "Delete without copy in clipboard content" })

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search hl", silent = true })

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("x", "x", '"_x', opts)


vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word cursor is on globally" })
vim.keymap.set("n", "<leader>x", "<cmd> !chmod +x %<CR>", {silent = true, desc = "Makes file executable"})


-- Hightlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Hightlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-hightlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})


-- tab stuff
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>") -- Open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>") -- Close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>") -- Go to next tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>") -- Go to pre tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>") -- Open current tab in new Tab

-- split
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split windows horizontally" }) -- split windows horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equals size" }) -- Make split windows equal width % height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Copy filepath to the clipboard
vim.keymap.set("n", "<leader>fp", function()
    local filepath = vim.fn.expand("%:~") -- Gets the file path relative to the home directory
    vim.fn.setreg("+", filepath) -- Copy the file path to the clipboard register
    print("File path copied to clipboard: " .. filepath)
end,
{ desc = "Copy file path to clipboard" })


vim.keymap.set("n", "<leader>l", ":Lazy<CR>")

vim.keymap.set("n", "<leader>e", function() require("mini.files").open() end)

vim.keymap.set('n', 'gl', vim.diagnostic.open_float)

vim.keymap.set("n", "<leader>gdi", vim.lsp.buf.definition, {desc = ""})
