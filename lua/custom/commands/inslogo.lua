return {
    cmd = 'InsLogo',
    func = function()
        local logopath = '~/template/logo'
        local file_content = vim.fn.readfile(vim.fn.expand(logopath))
        vim.fn.append(vim.fn.line('.'), tostring(file_content))
    end
}
