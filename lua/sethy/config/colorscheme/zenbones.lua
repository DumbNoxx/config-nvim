local status = pcall(vim.cmd.colorscheme, "tokyobones")

if not status then
    return
end

local groups = {
    "Normal",
    "NormalNC",
    "SignColumn",
    "LineNr",
    "EndOfBuffer",
    "NormalFloat",
    "FloatBorder",
    "MiniFilesNormal",
    "MiniFilesBorder",
    "MiniFilesTitle",
}
for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
end
