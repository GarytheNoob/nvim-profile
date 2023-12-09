return {
    {
        "christoomey/vim-tmux-navigator"
    },
    {
        'akinsho/toggleterm.nvim', version = "*", config = true
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },
	{
		"RRethy/vim-illuminate",
		config = function()
			require('illuminate').configure({
				providers = {
					-- 'lsp',
					-- 'treesitter',
					'regex',
				},
			})
		end
	},
}
