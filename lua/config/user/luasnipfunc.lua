local M = {}

M.nextchoice = function ()
    local ls = require("luasnip")
    if ls.choice_active() then
        ls.change_choice(1)
    else
        vim.notify("No choices available.")
    end
end

M.prevchoice = function ()
    local ls = require("luasnip")
    if ls.choice_active() then
        ls.change_choice(-1)
    else
        vim.notify("No choices available.")
    end
end

return M
