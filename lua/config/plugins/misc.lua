return {
    {"christoomey/vim-tmux-navigator"},
    {'akinsho/toggleterm.nvim', version = "*", config = true},
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },
}
