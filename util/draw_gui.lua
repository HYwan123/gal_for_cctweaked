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