local M = {}

M.setup = function()
    require("neoclip").setup({
        adapters = {
            require("neotest-vitest"),
            require("neotest-dart")({
                command = "flutter",
                use_lsp = true,
            }),
            require("neotest-rust"),
        },
        benchmark = {
            enabled = true,
        },
        consumers = {
            -- https://github.com/stevearc/overseer.nvim/blob/master/doc/third_party.md#neotest
            --   overseer = require("neotest.consumers.overseer"), --TODO use overseer to run tests by default
        },
        overseer = {
            enabled = true,
            -- When this is true (the default), it will replace all neotest.run.* commands
            force_default = false,
        },
        default_strategy = "integrated",
        diagnostic = {
            enabled = true,
            severity = 1,
        },
        discovery = {
            concurrent = 0,
            enabled = true,
        },
        floating = {
            border = "rounded",
            max_height = 0.6,
            max_width = 0.6,
            options = {},
        },
        highlights = {
            adapter_name = "NeotestAdapterName",
            border = "NeotestBorder",
            dir = "NeotestDir",
            expand_marker = "NeotestExpandMarker",
            failed = "NeotestFailed",
            file = "NeotestFile",
            focused = "NeotestFocused",
            indent = "NeotestIndent",
            marked = "NeotestMarked",
            namespace = "NeotestNamespace",
            passed = "NeotestPassed",
            running = "NeotestRunning",
            select_win = "NeotestWinSelect",
            skipped = "NeotestSkipped",
            target = "NeotestTarget",
            test = "NeotestTest",
            unknown = "NeotestUnknown",
        },
        --TODO
        icons = {
            child_indent = "│",
            child_prefix = "├",
            collapsed = "─",
            expanded = "╮",
            failed = "",
            final_child_indent = " ",
            final_child_prefix = "╰",
            non_collapsible = "─",
            passed = "",
            running = "",
            running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
            skipped = "",
            unknown = "",
        },
        jump = {
            enabled = true,
        },
        log_level = 3,
        output = {
            enabled = true,
            open_on_run = "short",
        },
        output_panel = {
            enabled = true,
            open = "botright split | resize 15",
        },
        projects = {},
        run = {
            enabled = true,
        },
        running = {
            concurrent = true,
        },
        status = {
            enabled = true,
            signs = true,
            virtual_text = true,
        },
        strategies = {
            integrated = {
                height = 40,
                width = 120,
            },
        },
        summary = {
            animated = true,
            enabled = true,
            expand_errors = true,
            follow = true,
            mappings = {
                attach = "a",
                clear_marked = "M",
                clear_target = "T",
                debug = "d",
                debug_marked = "D",
                expand = { "<CR>", "<2-LeftMouse>" },
                expand_all = "e",
                jumpto = "i",
                mark = "m",
                next_failed = "J",
                output = "o",
                prev_failed = "K",
                run = "r",
                run_marked = "R",
                short = "O",
                stop = "u",
                target = "t",
            },
            open = "botright vsplit | vertical resize 50",
        },
    })
end

return M
