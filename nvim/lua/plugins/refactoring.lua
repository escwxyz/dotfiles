-- Refactor
-- ~~~~~~~~
-- https://github.com/ThePrimeagen/refactoring.nvim

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

local M = {
    "ThePrimeagen/refactoring.nvim",
    enabled = true,
    cmd = "Refactor",
    config = function()
        require("refactoring").setup({
            prompt_func_return_type = lang,
            prompt_func_param_type = lang,
            printf_statements = {},
            print_var_statements = {},
        })
        vim.api.nvim_create_user_command("Refactor", function()
            require("refactoring").select_refactor()
        end, {})
    end
}

return M
