# GarytheNoob's [NeoVim](https://github.com/neovim/neovim) config

[![](https://img.shields.io/badge/Plugin_Manager-lazy.nvim-blue?style=flat-square)](https://github.com/folke/lazy.nvim)

This is my personal config of NeoVim, using [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager.

## File Structure

```text
.
├── lua
│   ├── config              # General configuration
│   │   ├── keymaps.lua         # keymap settings
│   │   ├── options.lua         # Options
│   │   └── plugin.lua          # Entry of `lazy.nvim`
│   ├── custom              # Custom settings
│   │   └── commands.lua        # Definition of user commands
│   └── plugins             # Plugins
│       ├── lsp                 # From `josean-dev/dev-environment-files`
│       │   ├── lspconfig.lua
│       │   ├── mason.lua
│       │   └── none-ls.lua
│       ├── alpha-nvim.lua      # Greeting
│       ├── bufferline.lua      # Tab line
│       ├── comment.lua         # Comment and Notes
│       ├── git.lua
│       ├── hop.lua
│       ├── indent.lua
│       ├── input.lua           # Related to input
│       ├── latex.lua           # VimTeX
│       ├── lualine.lua         # Statusline
│       ├── markdown.lua        # Preview etc.
│       ├── misc.lua            # Other stuff
│       ├── nvim-cmp.lua        # auto-complete form `josean-dev/dev-environment-files` 
│       ├── nvim-tree.lua       # Side panel for directory
│       ├── project.lua
│       ├── telescope.lua
│       ├── theme.lua
│       ├── treesitter.lua
│       └── ui.lua              # Relatex to Appearance
├── init.lua            # Main Entry of the config
└── README.md           # This file
```

