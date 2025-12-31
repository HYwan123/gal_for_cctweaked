function draw_gal_option(options)
    local height = 12
    local width = 40
    local null_lines = math.floor(height / (#options + 1))
    for i, option in ipairs(options) do
        option = option[1]
        term.setCursorPos(1, i*null_lines - 1)
        term.blit(string.rep("-", width), string.rep("0", width), string.rep("f", width))
        term.setCursorPos(1, i*null_lines)
        term.blit(string.rep(" ", width), string.rep("0", width), string.rep("f", width))
        local start_x = math.floor((width - #option) / 2) + 1
        term.setCursorPos(start_x, i*null_lines)
        term.blit(option, string.rep("0", #option), string.rep("f", #option))
        term.setCursorPos(1, i*null_lines + 1)
        term.blit(string.rep("-", width), string.rep("0", width), string.rep("f", width))
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
function draw_open(start_x, start_y)
    local paint = {
        {"                    ", "00000000000000000000", "00000000000000000000"},
        {"                    ", "00000000000000000000", "00000000000000000000"},
        {"                    ", "00000000000000000000", "00000000330000330000"},
        {"                    ", "00000000000000000000", "00000000330000330000"},
        {"                    ", "00000000000000000000", "00003300883300330000"},
        {"                    ", "00000000000000000000", "00007777666677770000"},
        {"                    ", "00000000000000000000", "00773377660077337700"},
        {"                    ", "00000000000000000000", "00773377660077337700"},
        {"                    ", "00000000000000000000", "33770033666633007733"},
        {"                    ", "00000000000000000000", "33336600000000663333"},
    }
    for i, line in ipairs(paint) do
        term.setCursorPos(start_x - 1, start_y + i - 1)
        term.blit(table.unpack(line))
    end
    
end

function draw_chat_kuang(start_y)
    local paint = {
        {" +-OpenGL----------------------------+", "00000000000000000000000000000000000000", "ffffffffffffffffffffffffffffffffffffff"},
        {" |                                   |", "00000000000000000000000000000000000000", "ffffffffffffffffffffffffffffffffffffff"},
        {" |                                   |", "00000000000000000000000000000000000000", "ffffffffffffffffffffffffffffffffffffff"},
        {" |                                   |", "00000000000000000000000000000000000000", "ffffffffffffffffffffffffffffffffffffff"},
        {" |                                   |", "00000000000000000000000000000000000000", "ffffffffffffffffffffffffffffffffffffff"},
        {" |                                   |", "00000000000000000000000000000000000000", "ffffffffffffffffffffffffffffffffffffff"},
        {" +-----------------------------------+", "00000000000000000000000000000000000000", "ffffffffffffffffffffffffffffffffffffff"}
    }

    for i, line in ipairs(paint) do
        term.setCursorPos(1, start_y + i - 1)
        term.blit(table.unpack(line))
    end
    
end
gal_1 = {
    "Who are you?",
    "Meow... I'm OpenGL.XNN.",
    "Do not stare at me like that.",
    "I am not strange, okay?"
}

gal_1_option = {
    {"You look nervous.", 2},
    {"Relax. I will not hurt you.", 3},
    {"Why are you hiding your tail?", 4}
}

gal_2 = {
    "Nya?! I am not nervous.",
    "This is just... normal reaction.",
    "You humans overthink everything."
}

gal_2_option = {
    {"Sure, sure.", 5},
    {"If you say so.", 3}
}

gal_3 = {
    "...Hmph.",
    "Just do not get too close.",
    "I can still help you render."
}

gal_3_option = {
    {"Then help me.", 5},
    {"You are kind of cute.", 6}
}

gal_4 = {
    "T-That is none of your business!",
    "Stop looking!",
    "I told you I am fine!"
}

gal_4_option = {
    {"Sorry.", 3},
    {"You are blushing.", 6}
}

gal_5 = {
    "I-I will try.",
    "Do not expect too much.",
    "If it fails, it is your fault."
}

gal_5_option = {
    {"Take your time.", 7},
    {"I trust you.", 8}
}

gal_6 = {
    "W-What?!",
    "Do not say things like that!",
    "Humans are troublesome..."
}

gal_6_option = {
    {"You hate it?", 9},
    {"I will stop teasing.", 3}
}

gal_7 = {
    "Okay... I will try my best.",
    "Rendering might take some time.",
    "Do not rush me."
}

gal_7_option = {
    {"I can wait.", 10},
    {"Take your time.", 11}
}

gal_8 = {
    "...Thank you for trusting me.",
    "It has been a while since someone did.",
    "I will do my best for you."
}

gal_8_option = {
    {"You're welcome.", 12},
    {"We make a good team.", 13}
}

gal_9 = {
    "I... guess I am not used to compliments.",
    "It is okay to tease sometimes.",
    "Just do not overdo it."
}

gal_9_option = {
    {"Got it.", 14},
    {"I'll be gentler.", 15}
}

gal_10 = {
    "The triangle is ready.",
    "It looks perfect.",
    "See? I told you I could do it."
}

gal_10_option = {
    {"Great job!", 16},
    {"Can you make more?", 17}
}

gal_11 = {
    "I am not sure about that...",
    "Maybe we should start small.",
    "One triangle at a time."
}

gal_11_option = {
    {"Good point.", 18},
    {"You're right.", 19}
}

gal_12 = {
    "Yes, we do.",
    "Even a cat can help with rendering.",
    "OpenGL and a human... interesting combination."
}

gal_12_option = {
    {"Nya~", 20},
    {"Let's continue.", 21}
}

gal_13 = {
    "Rendering complex shapes...",
    "This is what I am good at.",
    "Trust the process."
}

gal_13_option = {
    {"I trust you.", 22},
    {"Show me the result.", 23}
}

gal_14 = {
    "Thank you for understanding.",
    "I am not as strange as you thought, right?",
    "Maybe we can be friends."
}

gal_14_option = {
    {"Of course.", 24},
    {"Friends it is.", 25}
}

gal_15 = {
    "That is very kind of you.",
    "I am not used to being treated gently.",
    "I will remember this."
}

gal_15_option = {
    {"Anytime.", 26},
    {"We're good.", "gal_end_3"}
}

gal_16 = {
    "Thank you for your patience.",
    "The rendering is complete.",
    "Hope you like it."
}

gal_16_option = {
    {"This is great!", "gal_end_1"},
    {"You've been very helpful.", "gal_end_2"}
}

gal_end_1 = {
    "Triangle rendered.",
    "No mistakes.",
    "See? I am useful."
}

gal_end_1_option = {
    {"The end.", 999}  -- 999表示结束
}

gal_end_2 = {
    "...You trust me?",
    "That is reckless.",
    "But... I will not disappoint."
}

gal_end_2_option = {
    {"The end.", 999}  -- 999表示结束
}

gal_end_3 = {
    "I do not hate it.",
    "I just... am not used to it.",
    "That is all."
}

gal_end_3_option = {
    {"The end.", 999}  -- 999表示结束
}

term.clear()
draw_open(12, 2)
draw_chat_kuang(13)

now_gal_count = 1

while true do
    local dialog_key = "gal_" .. now_gal_count
    if type(now_gal_count) == "string" then
        dialog_key = now_gal_count  -- 如果now_gal_count已经是完整键名（如"gal_end_1"），直接使用
    end
    local dialog = _ENV[dialog_key]
    if not dialog then break end

    for _, line in ipairs(dialog) do
        draw_chat_text(line)
    end
    local option = _ENV[dialog_key .. "_option"]
    if not option then
        break -- 没选项就是结局
    end

    local choose = draw_gal_option(option)
    term.clear()
    draw_open(12, 2)
    draw_chat_kuang(13)

    now_gal_count = option[choose][2]
end
