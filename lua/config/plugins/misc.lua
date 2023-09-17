return {
    {"christoomey/vim-tmux-navigator"},
    {"p00f/nvim-ts-rainbow"},
    {'akinsho/toggleterm.nvim', version = "*", config = true},
    {"mg979/vim-visual-multi"},
    {"stevearc/dressing.nvim", event = "VeryLazy"},
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({
                map_cr = true,
                map_bs = false
            })
        end
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup()
        end
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },
    {
        "mg979/vim-visual-multi"
    },
    {
        "rcarriga/nvim-notify"
    },
}
