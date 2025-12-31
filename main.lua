require("util.draw_option")
require("util.draw_text")
require("util.draw_gui")
require("data.text")
term.clear()
draw_open(12, 2)
draw_chat_kuang(13)
for _, line in ipairs(gal_text) do
    draw_chat_text(line[1])
end
