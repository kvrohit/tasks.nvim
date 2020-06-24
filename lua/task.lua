local function tasks()
    local line = vim.api.nvim_get_current_line()
    if string.find(line, "☐") then
        replaced, count = string.gsub(line, "☐", "✔", 1)
        vim.api.nvim_set_current_line(replaced)
    elseif string.find(line, "✔") then
        replaced, count = string.gsub(line, "✔", "☐", 1)
        vim.api.nvim_set_current_line(replaced)
    else
        str = string.sub(line, string.find(line, "%w"))
        rep, _ = string.gsub(line, "%w", "☐ " .. str, 1)
        vim.api.nvim_set_current_line(rep)
    end
end

local function undo_task()
    local line = vim.api.nvim_get_current_line()
    replaced, count = string.gsub(line, "☐ ", "", 1)
    replaced, count = string.gsub(replaced, "✔ ", "", 1)
    vim.api.nvim_set_current_line(replaced)
end

return {
    tasks = tasks,
    undo = undo_task
}

