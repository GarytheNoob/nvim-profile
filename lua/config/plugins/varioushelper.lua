local autopair = {
    "windwp/nvim-autopairs",
    config = function()
        require("nvim-autopairs").setup({
            map_cr = true,
            map_bs = false
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

local colorizer = {
    "norcalli/nvim-colorizer.lua",
    config = function()
        require("colorizer").setup()
    end,
}

local multi = {
    "mg979/vim-visual-multi"
}


return {
    autopair, surround, multi, colorizer
}
