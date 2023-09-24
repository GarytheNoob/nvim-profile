local onedarkpro = {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    config = function()
        vim.cmd("colorscheme onedark_vivid")
    end
}

local onenord = {
    "rmehri01/onenord.nvim",
    priority = 1000
}

return {onedarkpro, onenord}
