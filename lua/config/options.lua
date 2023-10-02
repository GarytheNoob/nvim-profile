local opt = vim.opt

-------------------------------------
-- For GUIs like NeoVide
-------------------------------------
-- get # of Active Monitor 
function Get_connected_monitors()
    local result = vim.fn.system('xrandr -q | grep " connected" | wc -l') -- HACK: not on linux? no X open?
    return tonumber(result)
end
-- set display font size 
function Set_font_size()
    local connected_monitors = Get_connected_monitors()

    if connected_monitors > 1 then
        vim.cmd('set guifont=JetBrainsMono\\ Nerd\\ Font:h16')
    else
        vim.cmd('set guifont=JetBrainsMono\\ Nerd\\ Font:h10')
    end
end

-- run the function to set font size at start
Set_font_size()

-- run the function whenever entering/leaving a buffer
vim.cmd('autocmd FocusGained,BufEnter * lua Set_font_size()')
vim.cmd('autocmd FocusLost,BufLeave * lua Set_font_size()')

opt.linespace = -1

-- numbers
opt.relativenumber = true
opt.number = true

-- tab
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- no wrap except markdown
opt.wrap = false
vim.cmd([[
  augroup MarkdownSettings
    autocmd!
    autocmd FileType markdown setlocal wrap
  augroup END
]])

-- try to enable cursorline
opt.cursorline = true -- HACK: Conflict with the scheme? idk why not showing

-- use mouse
opt.mouse:append("a")
-- use system clipboard as well
opt.clipboard:append("unnamedplus")

-- enable spliting window/pane
opt.splitright = true
opt.splitbelow = true

-- cmd cases
opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true -- NOTE: This is already at the first line in `init.lua`, no real need here

-- I love sign columns
opt.signcolumn = "yes"

-- Use the plugin for notifications
vim.notify = require("notify")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Special cmd for adding logo/watermark to the file
function InsertLogo()
    local logopath = '~/template/logo'
    local file_content = vim.fn.readfile(vim.fn.expand(logopath))
    vim.fn.append(vim.fn.line('.'), file_content)
end
vim.cmd('command! InsLogo lua InsertLogo()')



-- NOTE: config neodev and lsp here
require("neodev").setup({})
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require("lspconfig").lua_ls.setup({
    settings = {
        Lua = {
            completion = {
                callSnippet = "Replace"
            }
        },
    },
    capabilities = capabilities,
})
