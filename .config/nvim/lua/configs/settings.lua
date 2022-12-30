--- Global Inital Settings
--- ~~~~~~~~~~~~~~~~~~~~~~
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

vim.o.timeoutlen = 250
vim.g.mapleader = " "
vim.g.maplocalleader = ' '
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

vim.opt.list = true
vim.opt.listchars:append "space:·"
vim.opt.listchars:append "eol:↴"

vim.o.breakindent = true

vim.o.undofile = true

vim.o.completeopt = 'menuone,noselect'

vim.o.winwidth = 10
vim.o.winminwidth = 10
vim.o.equalalways = false

vim.g.transparent_enabled = true -- todo put this as a theme opt

vim.o.cmdheight = 0

-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})
