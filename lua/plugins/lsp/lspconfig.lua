return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        -- import lspconfig plugin
        -- local lspconfig = require("lspconfig")

        -- import cmp-nvim-lsp plugin
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local keymap = vim.keymap -- for conciseness

        local opts = { noremap = true, silent = true }
        local on_attach = function(_, bufnr)
            opts.buffer = bufnr
            -- set keybinds
            keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
            keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
            keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
            keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
            keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
            keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
            keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
            keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
            keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
            keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
            keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
            keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
            keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
        end
        
        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Change the Diagnostic symbols in the sign column (gutter)
        -- (not in youtube nvim video)
        -- local signs = {}
        -- for type, icon in pairs() do
        --     local hl = "DiagnosticSign" .. type
        --     vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        -- end
        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = " ",
                    [vim.diagnostic.severity.WARN] = " ",
                    [vim.diagnostic.severity.HINT] = "󰠠 ",
                    [vim.diagnostic.severity.INFO] = " ",
                },
                linehl = {
                    [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
                },
                numhl = {
                    [vim.diagnostic.severity.WARN] = 'WarningMsg',
                },
            },
        })

        -- configure python server
        vim.lsp.config('basedpyright', {
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure lua server (with special settings)
        vim.lsp.config('lua_ls', {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = { -- custom settings for lua
                Lua = {
                    -- make the language server recognize "vim" global
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        -- make language server aware of runtime files
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })

        -- configure clangd
        vim.lsp.config('clangd', {
            on_attach = on_attach,
            capabilities = capabilities,
        })

        -- configure bashls
        vim.lsp.config('bashls', {
            on_attach = on_attach,
            capabilities = capabilities,
        })

        -- configure texlab
        vim.lsp.config('texlab', {
            on_attach = on_attach,
            capabilities = capabilities,
        })

    end,
}
