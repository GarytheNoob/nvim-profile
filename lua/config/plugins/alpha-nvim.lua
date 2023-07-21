return {
    'goolord/alpha-nvim',
    event = "VimEnter",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        -- require'alpha'.setup(require'alpha.themes.dashboard'.config)
        local status_ok, alpha = pcall(require, "alpha")
        if not status_ok then
            return
        end

        local dashboard = require "alpha.themes.dashboard"
        dashboard.section.header.val = {
            -- "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
            -- "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
            -- "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
            -- "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
            -- "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
            -- "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
            [[                                                                       ]],
            [[                                                                     ]],
            [[       ████ ██████           █████      ██                     ]],
            [[      ███████████             █████                             ]],
            [[      █████████ ███████████████████ ███   ███████████   ]],
            [[     █████████  ███    █████████████ █████ ██████████████   ]],
            [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
            [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
            [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
            [[                                                                       ]],
            "", "", "", "",
        }

        dashboard.section.buttons.val = {
            dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
            dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
            dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
            dashboard.button("t", "󱎸  Find text", ":Telescope live_grep <CR>"),
            dashboard.button("c", "  Configuration", ":e ~/.config/nvim/<CR>"),
            dashboard.button("q", "󰗼  Quit Neovim", ":qa<CR>"),
        }

        dashboard.section.footer.val = {
            "", "", "", "", "", "", "", "", "", "", "", "", "",
            "- GarytheNoob -",
            os.date("%Y / %m / %d") -- China style date format
        }
        dashboard.opts.opts.noautocmd = true
        alpha.setup(dashboard.opts)
    end
}





