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
    {
        'noearc/jieba.nvim',
        dependencies = {'noearc/jieba-lua'},
        config = function ()
            vim.keymap.set('n', 'ce', ":lua require'jieba_nvim'.change_w()<CR>", {noremap = false, silent = true})
            vim.keymap.set('n', 'de', ":lua require'jieba_nvim'.delete_w()<CR>",  {noremap = false, silent = true})
            vim.keymap.set('n', '<leader>w' , ":lua require'jieba_nvim'.select_w()<CR>", {noremap = false, silent = true})
        end
    },
}
