-- Refactor
-- ~~~~~~~~
-- https://github.com/ThePrimeagen/refactoring.nvim

local M = {}

M.setup = function()
    local lang = {
        typescript = true,
        javascript = true,
        lua = true,
        go = false,
        java = false,
        cpp = false,
        c = false,
        h = false,
        hpp = false,
        cxx = false,
    }
    require("refactoring").setup({
        prompt_func_return_type = lang,
        prompt_func_param_type = lang,
        printf_statements = {},
        print_var_statements = {},
    })
end

M.setup_cmds = function()
    vim.api.nvim_create_user_command("Refactor", function()
        require("refactoring").select_refactor()
    end, {})
end

return M
