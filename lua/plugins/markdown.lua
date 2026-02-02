return {
-- install without yarn or npm
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = ':call mkdp#util#install()',
    },

    {
        'AckslD/nvim-FeMaco.lua',
        ft = "markdown",
        config = function()
            require("femaco").setup()
        end
    }
}
