return {
    {"christoomey/vim-tmux-navigator"},
    {'akinsho/toggleterm.nvim', version = "*", config = true},
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },
    {
        "yamatsum/nvim-cursorline",
        config = function()
            require('nvim-cursorline').setup {
                cursorline = { enable = false }, -- HACK: Idk why no cursorline
                cursorword = {
                    enable = true,
                    min_length = 3,
                    hl = { underline = true },
                }
            }
        end
    },
}
