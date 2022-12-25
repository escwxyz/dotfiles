--- Global Settings
--- ~~~~~~~~~~~~~~
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.undofile = true

vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.o.updatetime = 250

vim.o.completeopt = 'menuone,noselect'

vim.o.timeoutlen = 500
vim.g.mapleader = " "
vim.g.maplocalleader = ' '
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
