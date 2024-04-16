local some = " React useState"
local some = " React useState"
local some = " React useState"



function find_line_word(path, pattern)

    local index, lines_alone = 1, {}

    local react_str, usestate_str = "React", "useState"
    

    for line in io.lines(path) do
        if string.find(line, pattern) and string.find(line, "React") then
            table.insert(lines_alone, {index, line})
        end
        index = index + 1
    end

    return lines_alone
end



local some = "useState, useState"
local res = find_line_word("tes.lua", "useState")
print(#res)

