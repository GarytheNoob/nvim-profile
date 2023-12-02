local opt = vim.opt

-------------------------------------
-- For GUIs like NeoVide
-------------------------------------

if vim.g.neovide then
    -- get # of Active Monitor 
    local function get_connected_monitors()
        local result = vim.fn.system('xrandr -q | grep " connected" | wc -l') -- TODO: not on linux? no X open?
        return tonumber(result)
    end
    -- set display font size 
    local function set_font_size()
        local connected_monitors = get_connected_monitors()

        if connected_monitors > 1 then
            opt.guifont = "JetBrainsMono NF:h14"
        else
            opt.guifont = "JetBrainsMono NF:h10"
        end
    end
    -- run the function to set font size at start
    set_font_size()
    opt.linespace = -1
    -- run the function whenever entering/leaving a buffer
    vim.cmd('autocmd FocusGained,BufEnter * lua set_font_size()')
    vim.cmd('autocmd FocusLost,BufLeave * lua set_font_size()')

end


-------------------------------------
-- General Config
-------------------------------------
-- gutters
opt.relativenumber = true
opt.number = true
opt.signcolumn = "yes"

-- tab
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- no wrap except certain filetype
opt.wrap = false
vim.cmd([[
  augroup MarkdownSettings
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal textwidth=80
    autocmd FileType tex setlocal wrap
    autocmd FileType tex setlocal textwidth=80
  augroup END
]])

-- visual
opt.termguicolors = true
opt.colorcolumn = {80}
opt.cursorline = true
opt.background = "dark"

-- use mouse
opt.mouse:append("a")

-- keybind init
vim.g.mapleader = " "

-- use system clipboard
opt.clipboard:append("unnamedplus")

-- enable spliting window/pane
opt.splitright = true
opt.splitbelow = true

-- cmd cases
opt.ignorecase = true
opt.smartcase = true

-- scrolloff
vim.o.scrolloff = 5

-- diagnostic
vim.diagnostic.config{
    underline = false,
}

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

