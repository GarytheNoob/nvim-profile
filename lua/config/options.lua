local opt = vim.opt

-------------------------------------
-- For GUIs like NeoVide
-------------------------------------

if vim.g.neovide then
    -- get # of Active Monitor 
    function Get_connected_monitors()
        local result = vim.fn.system('xrandr -q | grep " connected" | wc -l') -- TODO: not on linux? no X open?
        return tonumber(result)
    end
    -- set display font size 
    function Set_font_size()
        local connected_monitors = Get_connected_monitors()

        if connected_monitors > 1 then
            opt.guifont = "JetBrainsMono NF:h14"
        else
            opt.guifont = "JetBrainsMono NF:h10"
        end
    end
    -- run the function to set font size at start
    Set_font_size()
    opt.linespace = -1
    -- run the function whenever entering/leaving a buffer
    vim.cmd('autocmd FocusGained,BufEnter * lua Set_font_size()')
    vim.cmd('autocmd FocusLost,BufLeave * lua Set_font_size()')

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

-- visual
opt.termguicolors = true
opt.colorcolumn = {80}
opt.cursorline = true
opt.background = "dark"

-- format
opt.formatoptions="tcromqlw"
opt.textwidth = 80

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

-- Markdown preview setting: use chromium
vim.g.mkdp_browser = 'chromium'

-- enter insert mode in terminal
vim.api.nvim_create_autocmd({ "TermOpen" }, { command = "startinsert" })
