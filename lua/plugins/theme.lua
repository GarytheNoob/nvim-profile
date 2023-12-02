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

            vim.api.nvim_set_hl(0, "Visual", { bg = "#2e4c77" })
        end
    },
    {
        "rmehri01/onenord.nvim",
        priority = 1000
    },
    { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, },
    { "tandy1229/nvim-deus" }
}
