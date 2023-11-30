return {
    "L3MON4D3/LuaSnip", -- snippet engine

    config = function ()
        local status_ok, ls= pcall(require, "luasnip")
        if not status_ok then
            return
        end

        require("luasnip.loaders.from_lua").load(
            { paths = vim.fn.expand(vim.fn.stdpath('config') .. '/lua/custom/snippets')}
        )

        local types = require("luasnip.util.types")
        ls.config.set_config({
            history = true, --keep around last snippet local to jump back
            updateevents = "TextChanged,TextChangedI", --update changes as you type
            enable_autosnippets = true,
            ext_opts = {
                [types.choiceNode] = {
                    active = {
                        virt_text = { { "[CHOICE_NODE]", "GruvboxBlue" } }, -- TODO: the highlight group need fix
                    },
                },
                -- [types.insertNode] = {
                -- 	active = {
                -- 		virt_text = { { "●", "GruvboxBlue" } },
                -- 	},
                -- },
            },
        })
    end
}
