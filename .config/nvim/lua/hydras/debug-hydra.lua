local M = {}


local Hydra = require("hydra")

local dap = require("dap")

local hint = [[

^ ^back^ ^ ^     ^_b_: toggle breakpoint 
^ ^ _K_^ ^        _B_: clear breakpoints 
out _H_ ^ ^ _L_ into  _c_: continue
^ ^ _J_ ^ ^       _x_: terminate
^ ^over ^ ^     ^^_u_: open ui

^ ^    _<Esc>_: exit

]]

M.init_hydra = function()
    return Hydra({
        name = 'Debug Window',
        hint = hint,
        config = {
            color = 'pink',
            invoke_on_body = true,
            hint = {
                border = "rounded",
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
            { 'u', require("dapui").open, { exit = true, desc = 'open ui' } },
            { '<Esc>', nil, { exit = true, nowait = true, desc = 'exit' } },
        }
    })
end

return M



-- local status_hydra = Hydra({
--     name = "Debug Statusline",
--     hint = hint,
--     heads = {
--         { 'H', dap.step_out, { desc = 'step out' } },
--         { 'J', dap.step_over, { desc = 'step over' } },
--         { 'K', dap.step_back, { desc = 'step back' } },
--         { 'L', dap.step_into, { desc = 'step into' } },
--         { 'b', dap.toggle_breakpoint, { desc = 'toggle breakpoint' } },
--         { 'B', dap.clear_breakpoints, { desc = 'clear breakpoints' } },
--         { 'c', dap.continue, { desc = 'continue' } },
--         { 'x', dap.terminate, { desc = 'terminate' } },
--     }
-- })
