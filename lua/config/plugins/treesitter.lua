return { -- treesitter
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require 'nvim-treesitter.install'.compilers = { 'clang' }

        require'nvim-treesitter.configs'.setup {
            -- languages
            ensure_installed = "all",

            highlight = { enable = true },
            indent = { enable = true },

            -- brackets color
            rainbow = {
                enable = true,
                extended_mode = true,
                max_file_lines = nil,
            }
        }
    end
}
