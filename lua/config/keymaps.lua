-- FILENAME: keymaps.lua
-- DESCRIPTION: neovim config file setting the key bindings
-- ORIGIN: theniceboy
--
-- This file is partly or fully edited by
--  ▄▄▄  ▄  ▄▄  ▄ ▄      ▄▄     
--  █   █ █ █▄▀ █▄█   ▄█▀▀▀▀█▄  
--  █▄█ █▀█ █ █  █   █▀      ▀▀ 
--  ▄▄▄ ▄ ▄ ▄▄▄      █    ▀▄▄   
--   █  █▄█ █▄▄      █▄     ▀█▄ 
--   █  █ █ █▄▄       ▀█▄▄▄▄█▀  
--  ▄▄▄ ▄▄▄ ▄▄▄ ▄▄     ▄▄█▀     
--  █ █ █ █ █ █ █▄▀  ▄█▀        
--  █ █ █▄█ █▄█ █▄▀   ▀█▄▄      
--                       ▀▀     
-- GitHub: https://github.com/GarytheNoob

local mode_nv = { "n", "v" }
local mode_v = { "v" }
local mode_i = { "i" }
local nmappings = {
    -- escape INSERT mode
    {from = "jk",   to = "<ESC>",   mode = mode_i},

    -- moving selected lines
    {from = "K",   to = ":m '<-2<CR>gv=gv",   mode = mode_v},
    {from = "J",   to = ":m '>+1<CR>gv=gv",   mode = mode_v},

    -- hotkeys for saving(writing) and quitting
    {from = "<C-S>",   to = ":w<CR>"},
    {from = "<C-Q>",   to = ":q<CR>"},

    -- jump to the next `<++>` as placeholder
    {from = "<leader>ph",   to = '<ESC>/<++><CR>:nohl<CR>"_c4l'},

    -- turn the highlight of after searching
    {from = "<leader>nh",   to = vim.cmd.nohl},

    -- close the current buffer and open another
    {from = "<leader>qq",   to = vim.cmd.BufClose},

    -- Resize split panels
    {from = "<leader>sv",   to = "<C-w>v"},
    {from = "<leader>sh",   to = "<C-w>s"},
    {from = "<leader>ww",   to = "<C-w>="},
    {from = "H",   to = "<C-w><"}, -- TODO: This need another keybind
    {from = "L",   to = "<C-w>>"},

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
    {from = "<leader>fr",   to = require('telescope.builtin').oldfiles},

    -- toggleterm
    {from = "<leader>tt",   to = vim.cmd.OpenTerm},
    {from = "<leader>gg",   to = vim.cmd.Lazygit},

    -- display greeting screeen
    {from = "<leader>grt",  to = vim.cmd.Alpha},

    -- icon-picker
    {from = "<leader>ip",   to = vim.cmd.IconPickerNormal},

    -- LuaSnip
    {from = "<a-a>",        to = function() require("luasnip").expand() end, mode = {"i", "s"} },
    {from = "<a-l>",        to = function() require("luasnip").jump(1)  end, mode = {"i", "s"} },
    {from = "<a-h>",        to = function() require("luasnip").jump(-1) end, mode = {"i", "s"} },
    {
        from = "<a-j>",
        to = function()
            local ls = require("luasnip")
            if ls.choice_active() then
                ls.change_choice(1)
            else
                vim.notify("No choices available.")
            end
        end,
        mode = {"i", "s"}
    },
    {
        from = "<a-k>",
        to = function()
            local ls = require("luasnip")
            if ls.choice_active() then
                ls.change_choice(-1)
            else
                vim.notify("No choices available.")
            end
        end,
        mode = {"i", "s"}
    },

    -- Symbols_outline
    {from = "<leader>o",    to = vim.cmd.Outline},


}

-- I love this way to set keybinds
for _, mapping in ipairs(nmappings) do
    vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, { noremap = true })
end

