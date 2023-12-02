return {
    cmd = 'Lazygit',
    func =  function ()
        local Terminal  = require('toggleterm.terminal').Terminal
        local lazygit = Terminal:new({
            cmd = "lazygit",
            dir = "git_dir",
            direction = "float",
            float_opts = {
                border = "rounded",
            },
            -- function to run on opening the terminal
            on_open = function(term)
                vim.cmd("startinsert!")
                vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
            end,
            -- function to run on closing the terminal
            on_close = function(_)
                vim.cmd("startinsert!")
            end,
        })
        lazygit:toggle()
    end
}
