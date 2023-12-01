return {
    {
        "mg979/vim-visual-multi",
        event = "BufEnter",
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({
                map_cr = true,
                map_bs = false
            })
        end
    },
    {
        "sustech-data/wildfire.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("wildfire").setup()
        end,
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "InsertEnter",
        config = function()
            require("nvim-surround").setup()
        end
    },
}
