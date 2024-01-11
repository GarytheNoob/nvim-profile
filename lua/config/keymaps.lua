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

local mode_n    = { "n" }
local mode_v    = { "v" }
local mode_i    = { "i" }
local mode_t    = { "t" }
local mode_is   = { "i", "s" }
local mode_ni   = { "n", "i" }
local mode_nv   = { "n", "v" }
local nmappings = {
    -- escape INSERT mode
    { from = "jk",          to = "<ESC>",                                               mode = mode_i  },

    -- moving selected lines
    { from = "K",           to = ":m '<-2<CR>gv = gv",                                  mode = mode_v  },
    { from = "J",           to = ":m '>+1<CR>gv = gv",                                  mode = mode_v  },

    -- hotkeys for saving(writing) and quitting
    { from = "<C-S>",       to = vim.cmd.w,                                             mode = mode_n  },
    { from = "<C-Q>",       to = vim.cmd.q,                                             mode = mode_n  },

    -- jump to the next `<++>` as placeholder
    { from = "<A-n>",       to = '<ESC>/<++><CR>:nohl<CR>"_c4l',                        mode = mode_i  },

    -- turn the highlight off after searching
    { from = "<leader>nh",  to = vim.cmd.nohl,                                          mode = mode_n  },

    -- close the current buffer and open another
    { from = "<leader>qq",  to = vim.cmd.BufClose,                                      mode = mode_n  },

    -- Resize split panels
    { from = "<leader>sh",  to = ":set nosplitright<CR>:vsplit<CR>:set splitright<CR>", mode = mode_n  },
    { from = "<leader>sj",  to = ":set splitbelow<CR>  :split<CR>",                     mode = mode_n  },
    { from = "<leader>sk",  to = ":set nosplitbelow<CR>:split<CR> :set splitbelow<CR>", mode = mode_n  },
    { from = "<leader>sl",  to = ":set splitright<CR>  :vsplit<CR>",                    mode = mode_n  },
    { from = "<up>",        to = ":res +2<CR>",                                         mode = mode_n  },
    { from = "<down>",      to = ":res -2<CR>",                                         mode = mode_n  },
    { from = "<left>",      to = ":vertical resize-2<CR>",                              mode = mode_n  },
    { from = "<right>",     to = ":vertical resize+2<CR>",                              mode = mode_n  },
    { from = "<leader>srh", to = "<C-w>b<C-w>K",                                        mode = mode_n  },
    { from = "<leader>srv", to = "<C-w>b<C-w>H",                                        mode = mode_n  },

    -- Show Lazy Menu
    { from = "<leader>lz",  to = vim.cmd.Lazy,                                          mode = mode_n  },

    -- nvim-tree
    { from = "<leader>e",   to = vim.cmd.NvimTreeToggle,                                mode = mode_n  },

    -- buffer
    { from = "<leader>K",   to = vim.cmd.bnext,                                         mode = mode_n  },
    { from = "<leader>J",   to = vim.cmd.bprev,                                         mode = mode_n  },

    -- hop
    { from = "<leader>F",   to = vim.cmd.HopPattern,                                    mode = mode_n  },

    -- treesitter
    { from = "<leader>ff",  to = require('telescope.builtin').find_files,               mode = mode_n  },
    { from = "<leader>fg",  to = require('telescope.builtin').live_grep,                mode = mode_n  },
    { from = "<leader>fb",  to = require('telescope.builtin').buffers,                  mode = mode_n  },
    { from = "<leader>fh",  to = require('telescope.builtin').help_tags,                mode = mode_n  },
    { from = "<leader>fr",  to = require('telescope.builtin').oldfiles,                 mode = mode_n  },

    -- toggleterm
    { from = "<leader>tt",  to = vim.cmd.OpenTerm,                                      mode = mode_n  },
    { from = "<leader>gg",  to = vim.cmd.Lazygit,                                       mode = mode_n  },

    -- display greeting screeen
    { from = "<leader>grt", to = vim.cmd.Alpha,                                         mode = mode_n  },

    -- icon-picker
    { from = "<leader>ip",  to = vim.cmd.IconPickerNormal,                              mode = mode_n  },

    -- LuaSnip
    { from = "<A-a>",       to = function() require("luasnip").expand() end,            mode = mode_is },
    { from = "<A-l>",       to = function() require("luasnip").jump(1) end,             mode = mode_is },
    { from = "<A-h>",       to = function() require("luasnip").jump(-1) end,            mode = mode_is },
    { from = "<a-j>",       to = require("config.user.luasnipfunc").prevchoice,         mode = mode_is },
    { from = "<a-k>",       to = require("config.user.luasnipfunc").nextchoice,         mode = mode_is },

    -- Symbols_outline
    { from = "<leader>o",   to = vim.cmd.Outline,                                       mode = mode_n  },

    -- run code
    { from = "<leader>rr",  to = vim.cmd.RunCode,                                       mode = mode_n  },

    -- lsp fix
    { from = "<C-f>",       to = vim.lsp.buf.code_action,                               mode = mode_ni },
                                                                                                       }

-- I love this way to set keybinds
for _, mapping in ipairs(nmappings) do
    vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, { noremap = true })
end
