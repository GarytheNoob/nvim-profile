return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("nvim-tree").setup({
            sync_root_with_cwd = false,
            respect_buf_cwd = false,
            update_focused_file = {
                enable = false,
                update_root = false
            },
        })
    end
}

