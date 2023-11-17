local onedarkpro = {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    config = function()
        require("onedarkpro").setup({
            options = {
                cursorline = true,
            }
        })
        vim.cmd("colorscheme onedark_vivid")
        vim.cmd([[
            highlight Visual guibg=#abb2bf
            highlight Visual gui=reverse
            highlight Visual guibg=#282c34
        ]])
    end
}

local onenord = {
    "rmehri01/onenord.nvim",
    priority = 1000
}

return {onedarkpro, onenord}
