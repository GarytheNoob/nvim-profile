return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function ()
        vim.opt.termguicolors = true
        require("bufferline").setup{
            options = {
                diagnostics = "nvim_lsp",
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "  Directory",
                        highlight =  "Directory",
                        text_align = "center",
                        separator = true,
                    },
                },
                separator_style = "thick",
            }
        }
    end
}
