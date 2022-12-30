--- Test Engine
--- ~~~~~~~~~~~
--- https://github.com/nvim-neotest/neotest

return {
    "nvim-neotest/neotest",
    dependencies = {
        "antoinemadec/FixCursorHold.nvim",
        "marilari88/neotest-vitest",
        "sidlatau/neotest-dart",
        "rouge8/neotest-rust"
    },
    event = "VeryLazy",
    -- keys = {
    --     "<leader>t"
    -- },
    config = function()
        require("neotest").setup({
            adapters = {
                require('neotest-vitest'),
                require("neotest-dart") {
                    command = "flutter",
                    use_lsp = true,
                },
                require("neotest-rust")
            },
            benchmark = {
                enabled = true
            },
            consumers = {

            },
            default_strategy = "integrated",
            diagnostic = {
                enabled = true,
                severity = 1
            },
            discovery = {
                concurrent = 0,
                enabled = true
            },
            floating = {
                border = "rounded",
                max_height = 0.6,
                max_width = 0.6,
                options = {}
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
                unknown = "NeotestUnknown"
            },
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
                unknown = ""
            },
            jump = {
                enabled = true
            },
            log_level = 3,
            output = {
                enabled = true,
                open_on_run = "short"
            },
            output_panel = {
                enabled = true,
                open = "botright split | resize 15"
            },
            projects = {},
            run = {
                enabled = true
            },
            running = {
                concurrent = true
            },
            status = {
                enabled = true,
                signs = true,
                virtual_text = false
            },
            strategies = {
                integrated = {
                    height = 40,
                    width = 120
                }
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
                    target = "t"
                },
                open = "botright vsplit | vertical resize 50"
            }
        })

        --TODO keymapping

        vim.keymap.set("n", "<leader>t", require("neotest").summary.toggle)


        -- local Hydra = require("hydra")

        -- local hint = [[
        -- _r_: run nearst test _f_: run current test file
        -- _s_: stop the test _o_: check output
        -- ^
        -- _<Esc>_: exit
        -- ]]

        -- Hydra({
        --     name = "Test",
        --     config = {
        --         color = "teal",
        --         invoke_on_body = true,
        --         hint = {
        --             border = "rounded",
        --             position = "bottom"
        --         }
        --     },
        --     mode = "n",
        --     body = "<leader>t",
        --     heads = {
        --         { "r", function()
        --             require("neotest").run.run()
        --         end, { exit = false } },
        --         { "f", function()
        --             require("neotest").run.run(vim.fn.expand("%"))
        --         end, { exit = false } },
        --         { "s", function()
        --             require("neotest").run.stop()
        --         end, { exit = true } },
        --         { "o", require("neotest").summary.toggle },
        --         { "<Esc>", nil, { nowait = true } }
        --     }
        -- })
    end
}
