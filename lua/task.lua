local M = {}
local api = vim.api
local get_line = api.nvim_get_current_line
local set_line = api.nvim_set_current_line

local substitute = function(line, old_sym, new_sym, remove_text)
    replaced, _ = string.gsub(line, old_sym, new_sym, 1)
    if remove_text then
        replaced, _ = string.gsub(replaced, remove_text, "", 1)
    end
    return replaced
end

M.toggle = function()
    local line = get_line()
    if string.find(line, "☐") then
        set_line(substitute(line, "☐", "✔") .. os.date(" @done (%d/%m/%Y %X)"))
    elseif string.find(line, "✔") then
        set_line(substitute(line, "✔", "☐", "%s@done.*"))
    elseif string.find(line, "✗") then
        set_line(substitute(line, "✗", "☐", "%s@cancelled.*"))
    elseif string.find(line, "%w") then
        str = string.sub(line, string.find(line, "%w"))
        set_line(substitute(line, "%w", "☐ " .. str))
    else
        pos = string.find(line, "%s")
        if pos == nil then 
            pos = 0
            line = " "
        end
        str = string.sub(line, pos)
        set_line(substitute(line, "%s", "☐ " .. str))
    end
end

M.undo = function()
    set_line(
        substitute(
            substitute(
                substitute(
                    get_line(), "☐ ", ""
                ),
                "✔ ", "", "%s@done.*"
            ),
            "✗ ", "", "%s@cancelled.*"
        )
    )
end

M.cancel = function()
    local line = get_line()
    if string.find(line, "✗") then
        set_line(substitute(line, "✗ ", "☐ ", "%s@cancelled.*"))
    elseif string.find(line, "✔") then
        set_line(substitute(line, "✔ ", "✗ ", "%s@done.*") .. os.date(" @cancelled (%d/%m/%Y %X)"))
    elseif string.find(line, "☐") then
        set_line(substitute(line, "☐ ", "✗ ") .. os.date(" @cancelled (%d/%m/%Y %X)"))
    end
end

return M
