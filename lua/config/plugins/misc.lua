return {
    {"christoomey/vim-tmux-navigator"},
    {"p00f/nvim-ts-rainbow"},
    {'akinsho/toggleterm.nvim', version = "*", config = true},
    {"mg979/vim-visual-multi"},
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
        "yamatsum/nvim-cursorline",
        config = function()
            require('nvim-cursorline').setup {
                cursorline = {
                    enable = false,
                    -- timeout = 500,
                    -- number = false,
                },
                cursorword = {
                    enable = true,
                    min_length = 3,
                    hl = { underline = true },
                }
            }
        end
    },
    {
        "mg979/vim-visual-multi"
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("todo-comments").setup()
        end
    },
}
