require'lualine'.setup {
	options = {
		theme = 'everforest'
	}
}

vim.cmd "let g:everforest_background = 'hard'"
vim.cmd "let g:everforest_cursor = 'aqua'"
vim.cmd "let g:everforest_better_performance = 1"
vim.cmd "let g:everforest_transparent_background = 1"
vim.cmd "let g:everforest_float_style = 'dim'"
vim.cmd "let g:everforest_dim_inactive_windows = 1"

vim.o.termguicolors = false
vim.o.background = "dark"
vim.cmd [[colorscheme everforest]]
