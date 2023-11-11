
-- Using lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- require("config.plugins.hop"),
    -- require("config.plugins.misc"),
    -- require("config.plugins.comment"),
    -- require("config.plugins.indent"),
    -- require("config.plugins.theme"),
    -- require("config.plugins.lualine"),
    -- require("config.plugins.nvim-tree"),
    -- require("config.plugins.treesitter"),
    -- require("config.plugins.git"),
    -- require("config.plugins.telescope"),
    -- require("config.plugins.markdown"),
    -- require("config.plugins.lsp.cmp"),
    -- require("config.plugins.lsp.setup"),
    -- require("config.plugins.alpha-nvim"),
    -- require("config.plugins.bufferline"),
    -- require("config.plugins.ui"),
    -- require("config.plugins.project"),
    -- require("config.plugins.input"),
    -- require("config.plugins.latex"),
    {import = "config.plugins" },
    {import = "config.plugins.lsp" },
})
