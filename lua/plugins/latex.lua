return {
    {
        "lervag/vimtex",
        config = function()
            vim.g.tex_flavor = 'latex'
            vim.g.vimtex_quickfix_mode = 0
            vim.g.vimtex_view_general_viewer = 'zathura'
            vim.g.vimtex_view_method = 'zathura'
            -- vim.opt.conceallevel=1
            -- vim.g.tex_conceal='abdmg'
        end,
        ft = "tex"
    },
    {
        "iurimateus/luasnip-latex-snippets.nvim",
        config = function()
            require'luasnip-latex-snippets'.setup()
        end,
    }
}
