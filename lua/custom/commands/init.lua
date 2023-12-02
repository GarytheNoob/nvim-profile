local commands={
    require("custom.commands.inslogo"),
    require("custom.commands.bufclose"),
    require("custom.commands.lazygit"),
    require("custom.commands.openterm"),
}


for _, command in ipairs(commands) do
    vim.api.nvim_create_user_command(command.cmd, command.func, {})
end
