-- FILENAME: init.lua
-- DESCRIPTION: entrance of the config file of neovim
-- ORIGIN: NONE
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

vim.opt.termguicolors = true -- some plugins may need this
vim.g.mapleader = " "
require("config.plugin")
require("config.options")
require("config.keymaps")
