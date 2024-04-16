local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

local function copy(args)
	return args[1]
end

local function copy_capitalize_first_letter(args)
    return (args[1][1]:gsub("^%l", string.upper))
end

function find_line_word(pattern)
    
    -- get absolute path to current buffer
    local path = vim.api.nvim_buf_get_name(0)

    local index, lines = 1, {}

    for line in io.lines(path) do
        if string.find(line, pattern) then
            table.insert(lines, index)
        end
        index = index + 1
    end

    return lines
end

local function v_insert_import(_, _, pattern)

    vim.api.nvim_command(":w")

    local tbl_ipatterns = find_line_word(pattern)
    local len_keywords = #tbl_ipatterns

    local entry = 0

    if len_keywords > 1 then
        del_command = ":" .. tbl_ipatterns[1] .. " d"
        vim.api.nvim_command(del_command)
    end


    local two_dot, command = ":", " put = 'import {useState} from react'"
    local v_command = two_dot .. entry  .. command
    
    vim.api.nvim_command(v_command)

    return false
end

ls.add_snippets( "javascriptreact", {

    -- React Component
    
    s({trig = "jsx", dscr= "Some several examples withs Fragments", name = "React Component"}, {
        t({"import "}), 
        i(1, "style"), 
        t({" from './"}), 
        f(copy, 2), 
        t({".module.css'"}),
        t({"", "","const "}), 
        i(2, "Name"), 
        t({" = ("}), 
        i(3, "props"), 
        t({") => {"}),
        t({"", "\treturn ("}),
        i(0),
        c(4, {
            t({")", ""}),
            
            sn(nil, {
                t({"","\t\t<>"}),
                t({"", "\t\t\t"}), i(1),
                t({"","\t\t</>", "\t)", ""}),
            }),

        }),

        t({"}", ""}),
        t({"", "export default "}), 
        f(copy, 2)
    }),

    -- Hook useState

    s({trig = "hUseState", name = "Hook useState"}, {
        t("const ["),
        i(1, "name"),
        t(", set"),
        f(copy_capitalize_first_letter, 1),
        t("] = useState("),
        i(2, "0"),
        t(")"),
        c(3, {
            t(""),

            sn(nil, {
                f(v_insert_import, {}, {
                    user_args = {'useState'}
                }),
            }),
        }),
    }),
})
