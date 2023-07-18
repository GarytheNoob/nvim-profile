vim.g.mapleader = " "

local mode_nv = { "n", "v" }
local mode_v = { "v" }
local mode_i = { "i" }
local nmappings = {
    {from = "jk",   to = "<ESC>",   mode = mode_i},
    {from = "J",   to = ":m '>+1<CR>gv=gv'",   mode = mode_v},
    {from = "K",   to = ":m '<-2<CR>gv=gv'",   mode = mode_v},

    {from = "<leader>sv",   to = "<C-w>v"},
    {from = "<leader>sh",   to = "<C-w>s"},
    
    {from = "<leader>nh",   to = ":nohl<CR>"},
    
    -- nvim-tree
    {from = "<leader>e",   to = ":NvimTreeToggle<CR>"},

    -- bufferline
    {from = "<C-K>",   to = ":bnext<CR>"},
    {from = "<C-J>",   to = ":bprevious<CR>"},
    
    -- hop
    {from = "<C-F>",    to = ":HopPattern<CR>"}
}

for _, mapping in ipairs(nmappings) do
	vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, { noremap = true })
end

