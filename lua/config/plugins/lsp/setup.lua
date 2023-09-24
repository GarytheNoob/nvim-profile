P = {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup()
        end
    },
    {
        "folke/neodev.nvim",
        opts = {},
        -- config = function()
        --     require("neodev").setup({})
        -- end
    },
    {
        "neovim/nvim-lspconfig",
        -- config = function()
        --     local capabilities = require('cmp_nvim_lsp').default_capabilities()
        --
        --     require("lspconfig").lua_ls.setup({
        --         settings = {
        --             Lua = {
        --                 completion = {
        --                     callSnippet = "Replace"
        --                 }
        --             },
        --         },
        --         capabilities = capabilities,
        --     })
        -- end
    },
}

return P



