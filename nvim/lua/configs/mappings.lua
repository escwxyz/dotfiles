-- Global Keymappings
-- ~~~~~~~~~~~~~~~~~~
-- NOTE using cmds are much safer and preferred
--  NOTE don't directly call function to lazy load

local ck = require("caskey")
local cmd = ck.cmd
local emitted = ck.emitted
local ft = ck.ft

vim.g.mapleader = " "
vim.g.maplocalleader = " "

return {
    mode = { "n" },

    ["j"] = { act = "v:count == 0 ? 'gj': 'j'", expr = true, desc = "Jump one line down" },
    ["k"] = { act = "v:count == 0 ? 'gk':'k'", expr = true, desc = "Jump one line up" },

    -- Motion inside buffer
    -- TODO too many builtins messing around
    ["g"] = {
        name = "Goto",
        mode = { "n", "x" },

        ["t"] = { act = "gg", desc = "Top of the buffer" },
        ["b"] = { act = "G", desc = "Bottom of the buffer" },
        ["h"] = { act = "0", desc = "Head of the line" },
        -- ["f"] = { act = "_", desc = "First char of the line" },
        ["l"] = { act = "$", desc = "Last of the line" },
        ["u"] = { act = "<c-u>", desc = "Scroll up" },
        ["d"] = { act = "<C-d>", desc = "Scroll down" },

        ["k"] = { act = "H", desc = "Top of the window" },
        ["j"] = { act = "L", desc = "Bottom of the window" },
    },
    -- Treesitter Node Action
    ["n"] = { act = cmd("NodeAction"), desc = "TS Node Action" },

    ["zf"] = {
        name = "UFO",

        ["o"] = {
            act = cmd("UFOOpenAllFolds"),
            desc = "Open all folds",
            when = emitted("AllFoldsClosed"),
        }, -- TODO condition: when there are any folds
        ["c"] = {
            act = cmd("UFOCloseAllFolds"),
            desc = "Close all folds",
        }, -- TODO condition: when there are any unfolds
        ["p"] = {
            act = cmd("UFOGoNextClosedAndPeak"),
            desc = "Peak next fold",
            when = emitted("AllFoldsClosed"),
        },
        ["P"] = {
            act = cmd("UFOGoPrevClosedAndPeak"),
            desc = "Peak previous fold",
            when = emitted("AllFoldsClosed"),
        },
    },
    ["q"] = {
        --TODO normal mode
    },

    {
        mode = "t",
        when = {
            ft("FTerm"),
        },
        ["<A-q>"] = { act = cmd("CloseTerminal"), desc = "Close terminal" },
        ["<A-c>"] = { act = cmd("ExitTerminal"), desc = "Exit terminal" },
    },

    ["<A-r>"] = { act = "<C-r>", desc = "Redo" },

    ["<Tab>"] = { act = cmd("bnext"), desc = "Next buffer" },
    ["<S-Tab>"] = { act = cmd("bprevious"), desc = "Prev buffer" },

    ["<leader><right>"] = { act = cmd("tabnext"), desc = "Next tabpage" },
    ["<leader><left>"] = { act = cmd("tabprevious"), desc = "Prev tabpage" },
    ["<leader><BS>"] = { act = "O<Esc>", desc = "New line up" },
    ["<leader><Enter>"] = { act = "o<Esc>", desc = "New line down" },

    -- Actions
    ["<leader>a"] = {
        name = "Actions",

        s = {
            act = "<cmd>w<CR><Esc>",
            desc = "Save buffer",
        },
    },

    -- 🅱  Buffer TODO add ordinal number to buffers then use <leader>number to jump to specific buffer, <Tab> for tab pages or tabout.nvim?? or <->
    ["<leader>b"] = {
        name = "Buffer",

        ["q"] = { act = cmd("BufferRemove"), desc = "Quit current buffer" },
    },

	-- Code Outline
    ["<leader>c"] = { act = cmd("AerialToggle"), desc = "Code outline" },

    -- 🅳 Debug
    -- ["<leader>d"]

    -- 🅴 File Explorer
    ["<leader>e"] = { act = cmd("Nnn"), desc = "File Explorer" },

    -- Find files
    ["<leader>f"] = {
        name = "Find",

        b = {
            act = cmd("FzfLua blines"),
            desc = "Search in buffer",
        },
        f = { act = cmd("FzfLua files"), desc = "Files" },
        p = { act = cmd("FindProjects"), desc = "Projects" },
        g = { act = cmd("Telescope live_grep"), desc = "Live Grep" },
    },
    -- Git
    ["<leader>g"] = {
        name = "Git",
        ["d"] = {
            act = function()
                --todo
                print("diffview")
            end,
            desc = "Differ View",
        },
        ["<Enter>"] = { act = function() end, desc = "[Hydra] Git" },

        ["u"] = { act = cmd("Gitui"), desc = "GitUI" },
    },

    -- help tags
    ["<leader>h"] = { act = cmd("FzfLua help_tags"), desc = "Help Tags" },

    -- Oil
    ["<leader>i"] = { act = cmd("Oil --float"), desc = "Oil" }, -- TODO close buffer when open a file

    -- Job
    ["<leader>j"] = { act = cmd("OverseerRun"), desc = "Run jobs" },

    -- keymaps
    ["<leader>k"] = { act = cmd("FzfLua keymaps"), desc = "Find keymaps" },

    -- Links
    ["<leader>l"] = {
        act = function()
            vim.notify("Test")
        end, -- TODO why cmd works, while keymap not working
        desc = "[Hydra] URL View",
    },
    -- Marks --TODO sometimes triggered as m, not registered
    ["<leader>m"] = {
        act = cmd("HydraHarpoon"),
        desc = "[Hydra] Marks",
    },
    --
    -- NeoGen
    ["<leader>n"] = {
        name = "NeoGen",

        ["f"] = { act = cmd("Neogen func"), desc = "Function annotation" },
        ["c"] = { act = cmd("Neogen class"), desc = "Class annotation" },
        ["t"] = { act = cmd("Neogen type"), desc = "Type annotation" },
        ["l"] = { act = cmd("Neogen file"), desc = "File annotation" },
    },

    -- Editor Options TODO
    ["<leader>o"] = {
        act = cmd("HydraEditorOption"),
        desc = "Editor Options",
    },

    -- Plugins
    ["<leader>p"] = { act = cmd("Lazy"), desc = "Plugins" },

    -- 🆀 QuickFix
    --
    -- Refactor
    {
        mode = "v",
        ["<leader>r"] = { act = cmd("Refactor"), desc = "Refactor" },
    },
    -- 🆂 Session
    ["<leader>s"] = {
        name = "Session",

        ["r"] = { act = cmd("Autosession search"), desc = "Restore session" },
        ["s"] = { act = cmd("SaveSession"), desc = "Save session" },
        ["d"] = { act = cmd("Autosession delete"), desc = "Delete session" },
    },

    -- Terminal
    ["<leader>t"] = { act = cmd("OpenTerminal"), desc = "Terminal" },

    -- 🆄 Undotree
    ["<leader>u"] = { act = cmd("UndotreeToggle"), desc = "Undotree" },

    -- 🆅

    -- windows
    ["<leader>w"] = {

        name = "Windows",

        -- Navigation between windows
        ["h"] = { act = cmd("GotoLeftWindow"), desc = "Go to left window" },
        ["j"] = { act = cmd("GotoDownWindow"), desc = "Go to down window" },
        ["k"] = { act = cmd("GotoUpWindow"), desc = "Go to up window" },
        ["l"] = { act = cmd("GotoRightWindow"), desc = "Go to right window" },
        ["q"] = { act = "<C-w>q", desc = "Quit the current window" },

        -- Window Resize
        ["r"] = { act = cmd("StartResizeMode"), desc = "Start window resize mode" },

        ["H"] = { act = cmd("ResizeWindowLeft"), desc = "Resize window left" },
        ["K"] = { act = cmd("ResizeWindowUp"), desc = "Resize window up" },
        ["J"] = { act = cmd("ResizeWindowDown"), desc = "Resize window down" },
        ["L"] = { act = cmd("ResizeWindowRight"), desc = "Resize window right" },

        -- Window Maximize
        ["M"] = { act = cmd("WindowsMaximize"), desc = "Maximize" },
        ["_"] = { act = cmd("WindowsMaximizeHorizontally"), desc = "Maximize horizontally" },
        ["|"] = { act = cmd("WindowsMaximizeVertically"), desc = "Maximize vertically" },
        ["E"] = { act = cmd("WindowsEqualize"), desc = "Equalize" },

        -- WinShift (move window)
        ["<Left>"] = { act = cmd("WinShift left"), desc = "Move window left" },
        ["<Down>"] = { act = cmd("WinShift down"), desc = "Move window down" },
        ["<Up>"] = { act = cmd("WinShift up"), desc = "Move window up" },
        ["<Right>"] = { act = cmd("WinShift right"), desc = "Move window right" },
        ["<S-Left>"] = { act = cmd("WinShift far_left"), desc = "Move window far left" },
        ["<S-Up>"] = { act = cmd("WinShift far_up"), desc = "Move window far up" },
        ["<S-Down>"] = { act = cmd("WinShift far_down"), desc = "Move window far down" },
        ["<S-Right>"] = { act = cmd("WinShift far_right"), desc = "Move window far right" },

        ["s"] = { act = "<C-w>s", desc = "Split window horizontally" },
        ["v"] = { act = "<C-w>v", desc = "Split window vertically" },

        ["<Enter>"] = {
            act = cmd("HydraWindows"),
            desc = "[Hydra] Windows",
        },
    },

    -- 🆇
    -- Yanky Histoy
    ["<leader>y"] = {
        act = cmd("Neoclip"),
        desc = "Yank History",
    },

    -- ZenMode
    ["<leader>z"] = {
        name = "Zen Mode",

        ["s"] = { act = cmd("StartZenMode"), desc = "Start zen mode" },
        ["c"] = { act = cmd("StopZenMode"), desc = "Stop zen mode" },
    },

    -- LSP on_attach
    {
        mode = { "n" },
        when = "LspAttach",
        -- common lsp key bindings
        ["K"] = {
            act = function()
                vim.lsp.buf.hover()
            end,
            desc = "Hover",
        },
        ["]d"] = {
            act = function()
                vim.diagnostic.goto_next({})
            end,
            desc = "Next diagnostic",
        },
        ["[d"] = {
            act = function()
                vim.diagnostic.goto_prev({})
            end,
            desc = "Previous diagnostic",
        },
        -- When null-ls is attached
        ["<leader>af"] = {
            act = function()
                vim.lsp.buf.format() -- TODO conditional format on save
            end,
            desc = "[LSP] Format",
            --when_extend = vim.lsp.get_active_clients
        },
        ["gp"] = {
            name = "Goto Preview",

            ["d"] = {
                act = cmd("GotoPreviewDefinition"),
                desc = "[LSP] Goto preview definition",
            },
            ["i"] = {
                act = cmd("GotoPreviewImplementation"),
                desc = "[LSP] Goto preivew implementation",
            },
            ["t"] = {
                act = cmd("GotoPreviewTypeDefinition"),
                desc = "[LSP] Goto preview type definition",
            },
            ["r"] = {
                act = cmd("GotoPreviewReference"),
                desc = "[LSP] Goto preview reference",
            },
            ["q"] = {
                act = cmd("GotoPreviewCloseWin"),
                desc = "[LSP] Close all windows",
            },
        },
        -- Typescript related key bindings

        ["ai"] = {
            act = cmd("TypescriptAddMissingImports"),
            desc = "[LSP] Add missing imports",
            when_extend = emitted("TSServerAttached"),
        },
        ["oi"] = {
            act = cmd("TypescriptOrganizeImports"),
            desc = "[LSP] Organize imports",
            when_extend = emitted("TSServerAttached"),
        },
        ["ru"] = {
            act = cmd("TypescriptRemoveUnused"),
            desc = "[LSP] Remove unused vars",
            when_extend = emitted("TSServerAttached"),
        },
        ["fa"] = {
            act = cmd("TypescriptFixAll"),
            desc = "[LSP] Fix all",
            when_extend = emitted("TSServerAttached"),
        },
        -- TODO Rust related key bindings
    },
    -- Leap
    {
        mode = { "n", "x", "o" },
        ["s"] = {
            act = cmd("LeapBuffer"),
            desc = "[Leap] Search",
        },
        ["S"] = {
            act = cmd("LeapWindow"),
            desc = "[Leap] Search cross window",
        },
    },
}
