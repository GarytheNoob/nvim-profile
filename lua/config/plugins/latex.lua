return {
    {
        "lervag/vimtex",
        config = function()
            vim.cmd("let g:vimtex_view_general_viewer = 'zathura'")
            vim.cmd("let g:vimtex_view_method = 'zathura'")
        end
    },
}
