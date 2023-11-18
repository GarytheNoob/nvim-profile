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
    }
}

for _, command in ipairs(commands) do
    vim.api.nvim_create_user_command(command.cmd, command.func, {})
end
