vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = "2"
vim.opt.showcmd = true
vim.opt.title = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.guicursor = {}
vim.opt.encoding="utf-8"
vim.opt.mouse = "a"

-- use spaces for tabs and whatnot
vim.opt.scrolloff = 8
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.cc = "88"
vim.opt.ttyfast = true

vim.cmd [[ set noswapfile ]]
--vim.cmd [[ set termguicolors ]]

--Line numbers
vim.wo.number = true
vim.opt.relativenumber = true

