return {
    cmd = 'BufClose',
    func = function()
        vim.cmd("bd")
        vim.cmd("bprev")
    end
}
