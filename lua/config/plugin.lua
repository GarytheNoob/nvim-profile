local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {"christoomey/vim-tmux-navigator"},
    {"p00f/nvim-ts-rainbow"},

    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    },
    { 
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup {
                -- for example, context is off by default, use this to turn it on
                show_current_context = true,
                show_current_context_start = false,
            }
        end
    },

    {  
        "olimorris/onedarkpro.nvim",
        priority = 1000 -- Ensure it loads first
    },

    { -- lualine
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
        config = function()
            require("lualine").setup({
                options = {theme = "onedark"}
            })
        end
    },
    
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup()
        end
    },

    { -- treesitter
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require 'nvim-treesitter.install'.compilers = { 'clang' }

            require'nvim-treesitter.configs'.setup {
                -- 添加不同语言
                ensure_installed = "all",

                highlight = { enable = true },
                indent = { enable = true },

                -- 不同括号颜色区分
                rainbow = {
                    enable = true,
                    extended_mode = true,
                    max_file_lines = nil,
                }
            }
        end
    },

    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({
                map_cr = true
            })
        end
    },

    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require('gitsigns').setup {
                signs = {
                    add = { text = '+' },
                    change = { text = '~' },
                    delete = { text = '_' },
                    topdelete = { text = '‾' },
                    changedelete = { text = '~' },
                },
            }
        end
    }
})
