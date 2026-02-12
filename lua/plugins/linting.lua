return {
    "mfussenegger/nvim-lint",
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            javascript = { "eslint_d" },
            typescript = { "eslint_d" },
            javascriptreact = { "eslint_d" },
            typescriptreact = { "eslint_d" },
            svelte = { "eslint_d" },
            python = { "pylint" },
        }

        -- Configure pylint to use the venv's pylint if it exists
        local pylint = lint.linters.pylint
        pylint.cmd = function()
            local venv_path = vim.fn.findfile("pyproject.toml", ".;")
            if venv_path ~= "" then
                local venv_dir = vim.fn.fnamemodify(venv_path, ":h")
                local venv_pylint = venv_dir .. "/.venv/bin/pylint"
                if vim.fn.executable(venv_pylint) == 1 then
                    return venv_pylint
                end
            end
            -- Fallback to system/mason pylint
            return "pylint"
        end

        local lint_augroup =
            vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd(
            { "BufEnter", "BufWritePost", "InsertLeave" },
            {
                group = lint_augroup,
                callback = function()
                    lint.try_lint()
                end,
            }
        )

        vim.keymap.set("n", "<leader>l", function()
            lint.try_lint()
        end, { desc = "Trigger linting for current file" })
    end,
}
