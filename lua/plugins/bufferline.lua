vim.opt.termguicolors = true

require("bufferline").setup {
    options = {
        separator_style = "slant",

        style_preset = require('bufferline').style_preset.no_italic,

        -- 使用 nvim 内置lsp
        diagnostics = "nvim_lsp",
        -- 左侧让出 nvim-tree 的位置
        offsets = {{
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
        }}
    }
}
