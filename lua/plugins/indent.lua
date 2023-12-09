return { 
    {
		"shellRaining/hlchunk.nvim",
		init = function()
			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, { pattern = "*", command = "EnableHL", })
			require('hlchunk').setup({
				chunk = {
					enable = true,
					use_treesitter = true,
					style = {
						{ fg = "#7f848e" },
					},
				},
				indent = {
					chars = { "│", "¦", "┆", "┊", },
					use_treesitter = false,
				},
				blank = {
					enable = false,
				},
				line_num = {
					use_treesitter = true,
				},
			})
		end
    },
    -- {
    --     "lukas-reineke/indent-blankline.nvim",
    --     main = "ibl",
    --     config = function()
    --         require("ibl").setup({
    --             scope = {
    --                 show_start = false,
    --                 show_end = false,
    --             },
    --         })
    --     end
    -- }
}
