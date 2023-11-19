return {
    {
        "numToStr/Comment.nvim",
        event = "BufEnter",
        config = function()
            require("Comment").setup()
        end
    },
    {
        "folke/todo-comments.nvim",
        event = "BufEnter",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("todo-comments").setup()
        end
    },
}
