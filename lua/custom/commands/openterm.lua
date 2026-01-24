return {
    cmd = 'OpenTerm',
    func = function()
        local Terminal = require('toggleterm.terminal').Terminal

        local current_file_directory = vim.fn.expand("%:p:h")
        local term = Terminal:new({
            direction = "horizontal",
            dir = current_file_directory,
            env = {
                termapp = "nvim",
            },
            close_on_exit = true,
        })
        -- local term_command = string.format("ToggleTerm direction=horizontal size=20 cwd=%s",
        --     vim.fn.shellescape(current_file_directory))
        -- vim.cmd(term_command)
        term:toggle()
    end
}
