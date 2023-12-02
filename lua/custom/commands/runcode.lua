local split = function()
    -- split a pane below
    vim.cmd([[
        set splitbelow
        sp
        set nonumber
        set norelativenumber
        res -5
    ]])
end
local compileRun = function()
	vim.cmd("w")
	-- check file type
	local ft = vim.bo.filetype
	if ft == "python" then
        split()
		vim.cmd("term python %")
	elseif ft == "markdown" then
		vim.cmd(":MarkdownPreview")
	elseif ft == 'c' then
		split()
		vim.cmd("term gcc % -o %< && ./%< && rm %<")
	elseif ft == 'cpp' then
		split()
		vim.cmd("term g++ % -o %< && ./%< && rm %<")
	elseif ft == 'javascript' then
		split()
		vim.cmd("term node %")
	elseif ft == 'lua' then
		split()
		vim.cmd("term luajit %")
	elseif ft == 'tex' then
		vim.cmd(":VimtexCompile")
	end
end

return {
    cmd = "RunCode",
    func = compileRun
}
