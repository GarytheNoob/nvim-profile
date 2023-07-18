local autopair = {
    "windwp/nvim-autopairs",
    config = function()
        require("nvim-autopairs").setup({
            map_cr = true
        })
    end
}

local surround = {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup()
    end
}

return {autopair, surround}
