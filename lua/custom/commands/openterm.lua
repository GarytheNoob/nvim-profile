return {
    cmd = 'OpenTerm',
    func = function()
        local current_file_directory = vim.fn.expand("%:p:h")
        local term_command = string.format("ToggleTerm direction=horizontal size=20 cwd=%s",
            vim.fn.shellescape(current_file_directory))
        vim.cmd(term_command)
    end
}
