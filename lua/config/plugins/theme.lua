return {
    {
        "olimorris/onedarkpro.nvim",
        priority = 1000, -- Ensure it loads first
        config = function()
            require("onedarkpro").setup({
                options = {
                    cursorline = true,
                }
            })
            vim.cmd("colorscheme onedark_vivid")
        end
    },
    {
        "rmehri01/onenord.nvim",
        priority = 1000
    },
    { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, }
}
