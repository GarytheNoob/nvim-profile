return { -- lualine
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
    config = function()

        local color_table = { -- colors from onedarkpro.nvim
            bg = "#282c34",
            fg = "#abb2bf",
            red1 = "#ef596f",
            red2   = '#be5046',
            orange = "#d19a66",
            yellow = "#e5c07b",
            green = "#89ca78",
            cyan = "#2bbac5",
            blue = "#61afef",
            purple = "#d55fde",
            gray1  = '#828997',
            gray2  = '#2c323c',
            gray3  = '#3e4452',

        }
        local custom_onedark_vivid = {
            normal = {
                a = { fg = color_table.bg, bg = color_table.green, gui = 'bold' },
                b = { fg = color_table.fg, bg = color_table.gray3 },
                c = { fg = color_table.fg, bg = color_table.gray2 },
            },
            command = { a = { fg = color_table.bg, bg = color_table.yellow, gui = 'bold' } },
            insert = { a = { fg = color_table.bg, bg = color_table.blue, gui = 'bold' } },
            visual = { a = { fg = color_table.bg, bg = color_table.purple, gui = 'bold' } },
            terminal = { a = { fg = color_table.bg, bg = color_table.cyan, gui = 'bold' } },
            replace = { a = { fg = color_table.bg, bg = color_table.red1, gui = 'bold' } },
            inactive = {
                a = { fg = color_table.gray1, bg = color_table.gray2, gui = 'bold' },
                b = { fg = color_table.gray1, bg = color_table.gray2},
                c = { fg = color_table.gray1, bg = color_table.gray2 },
            },
        }

        require("lualine").setup({
            options = {
                theme = custom_onedark_vivid,
                ignore_focus = { "NvimTree", "Outline"},
            },
        })
    end
}
