--  0 1 2 3 4 5 6 7 8 9 a b c d e f
--  白 橙 品 浅 天 黄 粉 灰 浅 青 紫 蓝 棕 绿 红 黑
--
--  0 = white
--  1 = orange
--  2 = magenta
--  3 = lightBlue
--  4 = yellow
--  5 = lime
--  6 = pink
--  7 = gray
--  8 = lightGray
--  9 = cyan
--  a = purple
--  b = blue
--  c = brown
--  d = green
--  e = red
--  f = black


function draw_line(text, start_x, start_y, text_color, bg_color, is_clicked)
    if is_clicked then
        term.setCursorPos(start_x, start_y)
        term.blit(text, string.rep(text_color, #text), string.rep(bg_color, #text))
        return true
    end
    local text_color_str = ""
    local bg_color_str = ""

    for i = 1, #text do
        term.setCursorPos(start_x, start_y)
        text_color_str = text_color_str .. text_color
        bg_color_str = bg_color_str .. bg_color
        term.blit(string.sub(text, 1, i), text_color_str, bg_color_str)
        if i == #text then
            break
        end
        local timerID = os.startTimer(0.2)
        while true do
            local event, param1 = os.pullEvent()
            if event == "timer" and param1 == timerID then
                break
            elseif event == "mouse_click" then
                term.setCursorPos(start_x, start_y)
                term.blit(
                    text,
                    string.rep(text_color, #text),
                    string.rep(bg_color, #text)
                )
                return true
            end
        end
    end

    return false
end




function draw_gal_text(text, start_x, start_y, text_color, bg_color)
    local is_clicked = false
    local line_count = math.floor((#text + 30) / 31)
    for i = 0, line_count - 1 do
        is_clicked = draw_line(string.sub(text, i*31 + 1, (i+1)*31), start_x, start_y + i, text_color, bg_color, is_clicked)
    end
    os.pullEvent("mouse_click")
    for i = 0, line_count - 1 do
        term.setCursorPos(start_x - 4, start_y + i)
        term.blit(" |                                   |", "00000000000000000000000000000000000000", "ffffffffffffffffffffffffffffffffffffff")
    end
end

function draw_chat_text(text)
    draw_gal_text(text, 5, 15, "0", "f")
end

function draw_debug_text(text)
    term.setCursorPos(1, 1)
    term.setTextColor(colors.red)
    term.write(text)

end