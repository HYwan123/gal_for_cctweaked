require("util.draw_option")
require("util.draw_text")
require("util.draw_gui")
require("data.text")
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
