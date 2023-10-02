vim.g.mapleader = " "

local function toggle_term()
    local current_file_directory = vim.fn.expand("%:p:h")
    local term_command = string.format("ToggleTerm direction=horizontal size=20 cwd=%s", vim.fn.shellescape(current_file_directory))
    vim.cmd(term_command)
end

local function close_current_buffer()
    vim.cmd("bd")
    vim.cmd("bprev")
end


-- NOTE: KEYBINDS STARTS HERE    structure from theniceboy/nvim
local mode_nv = { "n", "v" }
local mode_v = { "v" }
local mode_i = { "i" }
local nmappings = {
    -- escape INSERT mode
    {from = "jk",   to = "<ESC>",   mode = mode_i},

    -- moving selected lines
    {from = "J",   to = ":m '>+1<CR>gv=gv'",   mode = mode_v},
    {from = "K",   to = ":m '<-2<CR>gv=gv'",   mode = mode_v},

    -- hotkeys for saving(writing) and quitting
    {from = "<C-S>",   to = ":w<CR>"},
    {from = "<C-Q>",   to = ":qa<CR>"},

    -- turn the highlight of after searching
    {from = "<leader>nh",   to = vim.cmd.nohl},

    -- close the current buffer and open another
    {from = "<leader>qq",   to = close_current_buffer}, -- TODO: Inline function?

    -- Resize split panels
    {from = "<leader>sv",   to = "<C-w>v"},
    {from = "<leader>sh",   to = "<C-w>s"},
    {from = "<leader>ww",   to = "<C-w>="},
    {from = "<leader>w,",   to = "<C-w><"},
    {from = "<leader>w.",   to = "<C-w>>"},

    -- Show Lazy Menu
    {from = "<leader>lz",   to = vim.cmd.Lazy},

    -- nvim-tree
    {from = "<leader>e",   to = vim.cmd.NvimTreeToggle},

    -- buffer
    {from = "<leader>K",   to = vim.cmd.bnext},
    {from = "<leader>J",   to = vim.cmd.bprev},

    -- hop
    {from = "<leader>F",    to = vim.cmd.HopPattern},

    -- treesitter
    {from = "<leader>ff",   to = require('telescope.builtin').find_files},
    {from = "<leader>fg",   to = require('telescope.builtin').live_grep},
    {from = "<leader>fb",   to = require('telescope.builtin').buffers},
    {from = "<leader>fh",   to = require('telescope.builtin').help_tags},

    -- toggleterm
    {from = "<leader>tt",   to = toggle_term},

    -- display greeting screeen
    {from = "<leader>grt",  to = vim.cmd.Alpha},

    -- icon-picker
    {from = "<leader>ip",   to = vim.cmd.IconPickerNormal},
    -- {from = "<leader>iy",   to = vim.cmd.IconPickerYank},
}

-- I love this way to set keybinds
for _, mapping in ipairs(nmappings) do
	vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, { noremap = true })
end

