local status, minifiles = pcall(require, "mini.files")

if not status then
    return
end

minifiles.setup({})

