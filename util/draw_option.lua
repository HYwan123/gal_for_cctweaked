--options{str, str}

function draw_gal_option(options)
    local height = 12
    local width = 40
    local null_lines = math.floor(height / (#options + 1))
    for i, option in ipairs(options) do
        term.setCursorPos(1, i*null_lines - 1)
        term.blit(string.rep("-", width), string.rep("f", width), string.rep("0", width))
        local start_x = math.floor((width - #option) / 2) + 1
        term.setCursorPos(start_x, i*null_lines)
        term.blit(option, string.rep("0", #option), string.rep("f", #option))
        term.setCursorPos(1, i*null_lines + 1)
        term.blit(string.rep("-", width), string.rep("f", width), string.rep("0", width))
    end
    while true do
        local _, _, x, y = os.pullEvent("mouse_click")
        for i = 1, #options do
            if y >= i*null_lines - 1 and y <= i*null_lines + 1 then
                return i
            end
        end
    end
    
end