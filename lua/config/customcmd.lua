-- FILENAME: <++>
-- DESCRIPTION: <++>
-- ORIGIN: <++>
--
-- This file is partly or fully edited by
--  ▄▄▄  ▄  ▄▄  ▄ ▄      ▄▄     
--  █   █ █ █▄▀ █▄█   ▄█▀▀▀▀█▄  
--  █▄█ █▀█ █ █  █   █▀      ▀▀ 
--  ▄▄▄ ▄ ▄ ▄▄▄      █    ▀▄▄   
--   █  █▄█ █▄▄      █▄     ▀█▄ 
--   █  █ █ █▄▄       ▀█▄▄▄▄█▀  
--  ▄▄▄ ▄▄▄ ▄▄▄ ▄▄     ▄▄█▀     
--  █ █ █ █ █ █ █▄▀  ▄█▀        
--  █ █ █▄█ █▄█ █▄▀   ▀█▄▄      
--                       ▀▀     
-- GitHub: https://github.com/GarytheNoob

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
    }
}

for _, command in ipairs(commands) do
    vim.api.nvim_create_user_command(command.cmd, command.func, {})
end
