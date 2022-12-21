--- Dislay Keymappings
--- ~~~~~~~~~~~~~~~~~~
--- SEE https://github.com/folke/which-key.nvim

vim.keymap.set("n", "<leader>h", "<cmd>:WhichKey<cr>", {
    desc = "Shoe Keymappings"
})

local M = {
    "folke/which-key.nvim",
    dependencies = {
        "mrjones2014/legendary.nvim",
    },
    init = function()
        require("which-key").setup({
            plugins = {
                presets = {
                    operators = false,
                    motions = false,
                    text_objects = false,
                    windows = false,
                    nav = false,
                    z = true,
                    g = true,
                },
            },
            window = {
                border = "none",
                position = "bottom",
                margin = { 1, 0, 1, 0 },
                padding = { 1, 1, 1, 1 },
                winblend = 0,
            },
        })
    end,
    config = function()
        require("which-key").register({
            ["<leader>"] = {
                b = {
                    name = "Bufferline commands",
                    d = "buffer: Sort by directory",
                    e = "buffer: Sort by extension",
                },

                d = {
                    name = "Dap commands",
                    b = "debug: Toggle breakpoint",
                    d = "debug: Terminate debug session",
                    r = "debug: Continue",
                    l = "debug: Open repl",
                    i = "debug: Step in",
                    o = "debug: Step out",
                    v = "debug: Step over",
                },
                f = {
                    name = "Telescope commands",
                    p = "find: Project",
                    w = "find: Word",
                    r = "find: File by frecency",
                    e = "find: File by history",
                    c = "ui: Change color scheme",
                    z = "edit: Change current directory by zoxide",
                    f = "find: File under current work directory",
                    g = "find: File under current git directory",
                    n = "edit: New file",
                },
                -- h = {
                --     name = "Gitsigns commands",
                --     b = "git: Blame line",
                --     p = "git: Preview hunk",
                --     s = "git: Stage hunk",
                --     u = "git: Undo stage hunk",
                --     r = "git: Reset hunk",
                --     R = "git: Reset buffer",
                -- },
                l = {
                    name = "LSP commands",
                    i = "lsp: LSP Info",
                    r = "lsp: LSP Restart",
                },
                n = {
                    name = "NvimTree commands",
                    f = "filetree: NvimTree find file",
                    r = "filetree: NvimTree refresh",
                },
                p = {
                    name = "Packer commands",
                    s = "packer: PackerSync",
                    i = "packer: PackerInstall",
                    c = "packer: PackerClean",
                    u = "packer: PackerUpdate",
                },
                s = {
                    name = "Session commands",
                    s = "sesson: Save session",
                    r = "sesson: Restore session",
                    d = "sesson: Delete session",
                },
                t = {
                    name = "Trouble commands",
                    d = "lsp: show document diagnostics",
                    w = "lsp: show workspace diagnostics",
                    q = "lsp: show quickfix list",
                    l = "lsp: show loclist",
                },
            },
            ["g"] = {
                a = "lsp: Code action",
                d = "lsp: Preview definition",
                D = "lsp: Goto definition",
                h = "lsp: Show reference",
                o = "lsp: Toggle outline",
                r = "lsp: Rename",
                s = "lsp: Signature help",
                t = "lsp: Toggle trouble list",
                b = "buffer: Buffer pick",
                p = {
                    name = "git commands",
                    s = "git: push",
                    l = "git: pull",
                },
            },
            ["<leader>G"] = "git: Show fugitive",
            ["<leader>g"] = "git: Show lazygit",
            ["<leader>D"] = "git: Show diff",
            ["<leader><leader>D"] = "git: Close diff",
            ["g["] = "lsp: Goto prev diagnostic",
            ["g]"] = "lsp: Goto next diagnostic",
            ["<leader>w"] = "jump: Goto word",
            ["<leader>j"] = "jump: Goto line",
            ["<leader>k"] = "jump: Goto line",
            ["<leader>c"] = "jump: Goto one char",
            ["<leader>cc"] = "jump: Goto two chars",
            ["<leader>o"] = "edit: Check spell",
        })
    end
}

return M
