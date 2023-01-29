-- Global Settings
-- ~~~~~~~~~~~~~~~
-- https://neovim.io/doc/user/options.html

vim.opt.breakindent = true

-- vim.opt.cmdheight = 0 
-- this makes no sense as there will always be a gap when terminal size is changed
-- this is caused by the fontsize and terminal itself, consider set this after using a GUI

vim.opt.cmdwinheight = 5

-- vim.opt.colorcolumn = { "+1" }

vim.opt.completeopt:append({ "menuone", "noinsert" })

vim.opt.confirm = true

-- vim.opt.cursorbind = true set this when in git diffview

-- vim.opt.cursorline / cursorcolumn => autocmds
vim.opt.equalalways = false

vim.opt.fillchars = {
    horiz = "━",
    horizup = "┻",
    horizdown = "┳",
    vert = "┃",
    vertleft = "┫",
    vertright = "┣",
    verthoriz = "╋",
    foldopen = "",
    foldclose = "",
    diff = "/",
    eob = " ",
}

vim.opt.foldlevel = 99

vim.opt.foldlevelstart = 99

vim.opt.ignorecase = true

vim.opt.laststatus = 3

vim.opt.list = true

-- vim.opt.listchars:append("space:·")

-- vim.opt.listchars:append("eol:↴")

vim.opt.mouse = ""

vim.opt.nrformats:append("alpha")

vim.opt.number = true

vim.opt.pumblend = 20

vim.opt.pumheight = 40

vim.opt.relativenumber = true

vim.opt.ruler = false

vim.opt.sessionoptions:append("localoptions")

vim.opt.showcmd = false

vim.opt.showtabline = 2

vim.opt.smartcase = true

vim.opt.splitright = true

vim.opt.tabstop = 4

vim.opt.termguicolors = true

vim.opt.timeoutlen = 300

vim.opt.undofile = true

vim.opt.undolevels = 100

vim.opt.updatetime = 250

vim.opt.visualbell = true

vim.opt.wildmode = { "full", "longest" }

vim.opt.winblend = 20

vim.opt.winwidth = 10

vim.opt.wrap = false
