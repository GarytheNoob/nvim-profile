return {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    event = "BufEnter",
    config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
}
