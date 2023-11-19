return {
    {
        "iamcco/markdown-preview.nvim",
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
        ft = "markdown",
    },
    {
        'AckslD/nvim-FeMaco.lua',
        ft = "markdown",
        config = function()
            require("femaco").setup()
        end
    }
}
