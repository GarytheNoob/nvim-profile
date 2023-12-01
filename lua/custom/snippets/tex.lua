local ls = require("luasnip")
local s = ls.s
local i = ls.i
local t = ls.t

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local function is_math()
    return vim.fn["vimtex#syntax#in_mathzone"]()
end

local snippets = {
    s(
        "documentclass",
        {
            t('\\documentclass{'),
            i(1, ""),
            t('}'),
        }
    ),
    s(
        "usepackage",
        fmt(
            [[
            \usepackage{}{{{}}}
        ]],
            {
                c(1, {
                    t(""),
                    sn(1,{
                        t("["),
                        i(1, ""),
                        t("]")
                    })
                }),
                i(2, "")
            }
        )
    )
}

local autosnippets = {
    s(
        "//",
        fmt(
            [[
            \frac{{{}}}{{{}}}
        ]],
            {
                i(1, ""),
                i(2, ""),
            }
        ),
        {
            condition = is_math -- TODO: WHY THIS DOESN'T WORK??
        }
    ),
    s(
        "dd",
        {
            t('{\\mathrm d}')
        },
        {
            condition = is_math
        }
    ),
    s(
        "spd",
        {
            t('\\,{\\mathrm d}')
        },
        {
            condition = is_math
        }
    )
}


return snippets, autosnippets
