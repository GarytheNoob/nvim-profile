return { -- lualine
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
    config = function()
        require("lualine").setup({
            options = {
                theme = 'auto',
                ignore_focus = { "NvimTree", "Outline", "no-neck-pain" },
            },
        })
    end
}
