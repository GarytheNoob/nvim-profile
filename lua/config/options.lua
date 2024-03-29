local opt                      = vim.opt
local env                      = vim.env
local g                        = vim.g

-------------------------------------
-- General Config
-------------------------------------
-- gutters
opt.relativenumber             = true
opt.number                     = true
opt.signcolumn                 = "yes"

-- tab
opt.tabstop                    = 4
opt.shiftwidth                 = 4
opt.expandtab                  = true
opt.autoindent                 = true

-- visual
opt.ttyfast                    = true
opt.termguicolors              = true
env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
opt.colorcolumn                = { 80 }
opt.cursorline                 = true
opt.background                 = "dark"
opt.wrap                       = false
opt.guifont                    = "JetBrainsMono NF:h14"

-- format
opt.formatoptions              = "tcromqlw"
opt.textwidth                  = 80

-- keybind init
g.mapleader                    = " "

-- enable spliting window/pane
opt.splitright                 = true
opt.splitbelow                 = true

-- cmd cases
opt.ignorecase                 = true
opt.smartcase                  = true

-- scrolloff
vim.o.scrolloff                = 5

g.loaded_netrw                 = 1
g.loaded_netrwPlugin           = 1

-- Markdown preview setting: use chromium
g.mkdp_browser                 = 'chromium'

-- diagnostic
vim.diagnostic.config {
    underline = false,
}

-- use mouse
opt.mouse:append("a")

-- use system clipboard
opt.clipboard:append("unnamedplus")

-- enter insert mode in terminal
vim.api.nvim_create_autocmd({ "TermOpen" }, { command = "startinsert" })
