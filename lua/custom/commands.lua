local commands={
    {
        cmd = 'InsLogo',
        func = function()
            local logopath = '~/template/logo'
            local file_content = vim.fn.readfile(vim.fn.expand(logopath))
            vim.fn.append(vim.fn.line('.'), file_content)
        end
    },
    {
        cmd = 'BufClose',
        func = function()
            vim.cmd("bd")
            vim.cmd("bprev")
        end
    },
    {
        cmd = 'OpenTerm',
        func = function()
            local current_file_directory = vim.fn.expand("%:p:h")
            local term_command = string.format("ToggleTerm direction=horizontal size=20 cwd=%s",
                vim.fn.shellescape(current_file_directory))
            vim.cmd(term_command)
        end
    },
    {
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
                on_close = function(term)
                    vim.cmd("startinsert!")
                end,
            })
            lazygit:toggle()
        end
    }
}


for _, command in ipairs(commands) do
    vim.api.nvim_create_user_command(command.cmd, command.func, {})
end
