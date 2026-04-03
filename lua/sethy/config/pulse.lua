local status, pulse = pcall(require, "pulse")
if not status then
    return
end


pulse.setup({})
