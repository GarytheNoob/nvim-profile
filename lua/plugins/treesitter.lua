return {
    {"lincheney/nvim-ts-rainbow"}, -- NOTE: Change origin - p00f stopped maintaining
    { -- treesitter
        "nvim-treesitter/nvim-treesitter",
        -- branch = 
        config = function()
            require 'nvim-treesitter.install'.compilers = { 'clang' }

            require'nvim-treesitter.configs'.setup {
                -- languages
                ensure_installed = "all",
                auto_install = true,
                sync_install = true,
                ignore_install = {"ipkg",},
                modules = {},
                highlight = {
                    enable = true,
                    disable = { "latex" },
                    additional_vim_regex_highlighting = { "latex", "markdown" },
                },
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
}
