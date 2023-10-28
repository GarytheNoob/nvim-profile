return {
    {
        "lervag/vimtex",
        config = function()
            vim.cmd([[
                let g:tex_flavor = 'latex'
                let g:vimtex_quickfix_mode = 0
                let g:vimtex_view_general_viewer = 'zathura'
                let g:vimtex_view_method = 'zathura'
            ]])
        end
    },
}
