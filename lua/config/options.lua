local opt = vim.opt

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

opt.relativenumber = true
opt.number = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.wrap = false
vim.cmd([[
  augroup MarkdownSettings
    autocmd!
    autocmd FileType markdown setlocal wrap
  augroup END
]])

opt.cursorline = true

opt.mouse:append("a")

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.signcolumn = "yes"

vim.notify = require("notify")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

function InsertLogo()
    local logopath = '~/template/logo'
    local file_content = vim.fn.readfile(vim.fn.expand(logopath))
    vim.fn.append(vim.fn.line('.'), file_content)

    -- -- 調用Comment.nvim的gc快捷鍵來添加註釋
    -- -- 注意這裡的`gc`是Comment.nvim中預設的快捷鍵，如果你修改了快捷鍵，需要將其替換為你設置的值
    -- vim.api.nvim_feedkeys('gc', 'n', true)
    --
    -- -- 在插入的內容中搜索並移動到佔位符<++>
    -- local placeholder_pattern = '<%+%+>'
    -- local start_line = vim.fn.line('.')
    -- local end_line = start_line + #file_content - 1
    -- for line_number = start_line, end_line do
    --     local line_content = vim.fn.getline(line_number)
    --     local _, start_col = string.find(line_content, placeholder_pattern)
    --     if start_col then
    --         vim.fn.cursor(line_number, start_col + 1)
    --         break
    --     end
    -- end
end

-- 將自定義函數與指令映射
vim.cmd('command! InsLogo lua InsertLogo()')


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
