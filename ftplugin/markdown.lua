-- wrapping behavior
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.list = false

-- disable textwidth (no hard wrapping)
vim.opt_local.textwidth = 0
vim.opt_local.colorcolumn = "" -- disable color column

-- disable automatic formatting
vim.opt_local.formatoptions:remove({ "t", "c", "r", "o" })
vim.opt_local.breakindent = true -- indent wrapped lines nicely
vim.opt_local.spell = true -- spell check
