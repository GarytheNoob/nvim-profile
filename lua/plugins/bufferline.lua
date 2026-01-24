M = {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function ()
        vim.opt.termguicolors = true
        require("bufferline").setup{
            options = {
                -- mode = "tabs", -- TEST:
                diagnostics = "nvim_lsp",
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "  Current Working DIR",
                        highlight =  "Directory",
                        text_align = "center",
                        separator = true,
                    },
                    {
                        filetype = "neo-tree",
                        text = "  Current Working DIR",
                        highlight =  "Directory",
                        text_align = "center",
                        separator = true,
                    },
                },
                separator_style = "slant",
            }
        }
    end
}

if false then
    return M
else
    return {}
end

