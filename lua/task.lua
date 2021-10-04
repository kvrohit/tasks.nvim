local function tasks()
    local line = vim.api.nvim_get_current_line()
    if string.find(line, "☐") then
        replaced, count = string.gsub(line, "☐", "✔", 1)
        vim.api.nvim_set_current_line(replaced .. os.date(" @done (%d/%m/%Y %X)"))
    elseif string.find(line, "✔") then
        replaced, count = string.gsub(line, "✔", "☐", 1)
        replaced, count = string.gsub(replaced, "%s@done.*", "", 1)
        vim.api.nvim_set_current_line(replaced)
    elseif string.find(line, "%w") then
        str = string.sub(line, string.find(line, "%w"))
        rep, _ = string.gsub(line, "%w", "☐ " .. str, 1)
        vim.api.nvim_set_current_line(rep)
    else
        pos = string.find(line, "%s")
        if pos == nil then 
            pos = 0
            line = " "
        end
        str = string.sub(line, pos)
        rep, _ = string.gsub(line, "%s", "☐ " .. str, 1)
        vim.api.nvim_set_current_line(rep)
    end
end

local function undo_task()
    local line = vim.api.nvim_get_current_line()
    replaced, count = string.gsub(line, "☐ ", "", 1)
    replaced, count = string.gsub(replaced, "%s@done.*", "", 1)
    replaced, count = string.gsub(replaced, "✔ ", "", 1)
    vim.api.nvim_set_current_line(replaced)
end

local function cancel_task()
    local line = vim.api.nvim_get_current_line()
    replaced, count = string.gsub(line, "☐ ", "✗ ", 1)
    replaced, count = string.gsub(line, "✔ ", "✗ ", 1)
    replaced, count = string.gsub(replaced, "%s@done.*", "", 1)
    vim.api.nvim_set_current_line(replaced .. os.date(" @cancelled (%d/%m/%Y %X)"))
end

return {
    tasks = tasks,
    undo = undo_task,
    cancel = cancel_task,
}
