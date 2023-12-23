-- We all love making the ui better

return {
	{
		"nvim-zh/colorful-winsep.nvim",
		config = function ()
            local colorful_winsep = require("colorful-winsep")
            colorful_winsep.setup({
                no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest", "NvimTree", "Outline", "no-neck-pain"},
                create_event = function() -- disable in NvimTree
                    local win_n = require("colorful-winsep.utils").calculate_number_windows()
                    if win_n == 2 then
                        local win_id = vim.fn.win_getid(vim.fn.winnr('h'))
                        local filetype = vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(win_id), 'filetype')
                        if filetype == "NvimTree" then
                            colorful_winsep.NvimSeparatorDel()
                        end
                    end
                end
            })
		end,
		event = { "WinNew" },
	},
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy"
    },
    {
        "ziontee113/icon-picker.nvim",
        config = function()
            require("icon-picker").setup({
                disable_legacy_commands = true
            })
        end
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            {
                "rcarriga/nvim-notify",
                config = function ()
                    require("notify").setup({
                        max_winth = 15,
                        minimum_width = 5
                    })
                    vim.notify = require("notify")
                end
            },
        },
        config = function()
            require("noice").setup({
                presets = {
                    long_message_to_split =  true,
                },
                views = {
                    cmdline_popup = {
                        position = {
                            row = 5,
                            col = "50%",
                        },
                        size = {
                            width = 60,
                            height = "auto",
                        },
                    },
                    popupmenu = {
                        relative = "editor",
                        position = {
                            row = 8,
                            col = "50%",
                        },
                        size = {
                            width = 60,
                            height = 10,
                        },
                        border = {
                            style = "rounded",
                            padding = { 0, 1 },
                        },
                        win_options = {
                            winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
                        },
                    },
                },
            })
            require("telescope").load_extension("noice")
        end
    },
    {"shortcuts/no-neck-pain.nvim", version = "*"}
}
