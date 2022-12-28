return {
    "mfussenegger/nvim-dap",
    dependencies = {
        { "rcarriga/nvim-dap-ui", },
    },
    keys = { "<leader>d" },
    config = function()
        ----------------------
        ------- Dapui --------
        ----------------------

        require("dapui").setup({
            icons = { expanded = "", collapsed = "", current_frame = "" },
            mappings = {
                -- Use a table to apply multiple mappings
                -- expand = { "<CR>", "<2-LeftMouse>" },
                -- open = "o",
                -- remove = "d",
                -- edit = "e",
                -- repl = "r",
                -- toggle = "t",
            },
            -- Use this to override mappings for specific elements
            element_mappings = {
                -- Example:
                -- stacks = {
                --   open = "<CR>",
                --   expand = "o",
                -- }
            },
            -- Expand lines larger than the window
            -- Requires >= 0.7
            expand_lines = vim.fn.has("nvim-0.7") == 1,
            -- Layouts define sections of the screen to place windows.
            -- The position can be "left", "right", "top" or "bottom".
            -- The size specifies the height/width depending on position. It can be an Int
            -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
            -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
            -- Elements are the elements shown in the layout (in order).
            -- Layouts are opened in order so that earlier layouts take priority in window sizing.
            layouts = {
                {
                    elements = {
                        -- Elements can be strings or table with id and size keys.
                        { id = "scopes", size = 0.25 },
                        "breakpoints",
                        "stacks",
                        "watches",
                    },
                    size = 40, -- 40 columns
                    position = "left",
                },
                {
                    elements = {
                        "repl",
                        "console",
                    },
                    size = 0.25, -- 25% of total lines
                    position = "bottom",
                },
            },
            controls = {
                enabled = true,
                -- Display controls in this element
                element = "repl",
                icons = {
                    pause = "",
                    play = "",
                    step_into = "",
                    step_over = "",
                    step_out = "",
                    step_back = "",
                    run_last = "",
                    terminate = "",
                },
            },
            floating = {
                max_height = nil, -- These can be integers or a float between 0 and 1.
                max_width = nil, -- Floats will be treated as percentage of your screen.
                border = "single", -- Border style. Can be "single", "double" or "rounded"
                mappings = {
                    close = { "q", "<Esc>" },
                },
            },
            windows = { indent = 1 },
            render = {
                max_type_length = nil, -- Can be integer or nil.
                max_value_lines = 100, -- Can be integer or nil.
            }
        })

        -----------------------------------------
        --------------- Keymaps -----------------
        -----------------------------------------

        local Hydra = require("hydra")

        local dap = require("dap")

        local hint = [[
     ^ ^Step^ ^ ^      ^ ^     Action
 ----^-^-^-^--^-^----  ^-^-------------------  
     ^ ^back^ ^ ^     ^_b_: toggle breakpoint 
     ^ ^ _K_^ ^        _B_: clear breakpoints 
 out _H_ ^ ^ _L_ into  _c_: continue
     ^ ^ _J_ ^ ^       _x_: terminate
     ^ ^over ^ ^     ^^_r_: open repl

     ^ ^  _<Esc>_: exit
]]

        Hydra({
            name = 'Debug',
            hint = hint,
            config = {
                color = 'pink',
                invoke_on_body = true,
                hint = {
                    type = 'window'
                },
            },
            mode = { 'n' },
            body = '<leader>d',
            heads = {
                { 'H', dap.step_out, { desc = 'step out' } },
                { 'J', dap.step_over, { desc = 'step over' } },
                { 'K', dap.step_back, { desc = 'step back' } },
                { 'L', dap.step_into, { desc = 'step into' } },
                { 'b', dap.toggle_breakpoint, { desc = 'toggle breakpoint' } },
                { 'B', dap.clear_breakpoints, { desc = 'clear breakpoints' } },
                { 'c', dap.continue, { desc = 'continue' } },
                { 'x', dap.terminate, { desc = 'terminate' } },
                { 'r', dap.repl.open, { exit = true, desc = 'open repl' } },
                { '<Esc>', nil, { exit = true, nowait = true, desc = 'exit' } },
            }
        })

    end
}
