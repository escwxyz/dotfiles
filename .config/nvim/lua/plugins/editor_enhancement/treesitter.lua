--Syntax Highlight
--~~~~~~~~~~~~~~~~
--https://github.com/nvim-treesitter/nvim-treesitter#quickstart

local M = {}

M.setup_cmd = function()
    vim.cmd([[
        omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>
        xnoremap <silent> m :lua require('tsht').nodes()<CR>
      ]])
end

M.setup = function()
    require("nvim-treesitter.configs").setup({
        ensure_installed = "all",
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = { "markdown" }, -- for obsidian
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<A-CR>",
                node_incremental = "<A-CR>",
                scope_incremental = "<A-s>",
                node_decremental = "<A-BS>",
            },
        },
        indent = {
            enable = true,
        },
        -- TODO
        textobjects = {
            -- https://github.com/RRethy/nvim-treesitter-textsubjects
            enable = true,
            prev_selection = ",", -- (Optional) keymap to select the previous selection
            keymaps = {
                ["."] = "textsubjects-smart",
                [";"] = "textsubjects-container-outer",
                ["i;"] = "textsubjects-container-inner",
            },
            select = {
                enable = true,
                lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ["aa"] = "@parameter.outer",
                    ["ia"] = "@parameter.inner",
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                },
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    ["]m"] = "@function.outer",
                    ["]]"] = "@class.outer",
                },
                goto_next_end = {
                    ["]M"] = "@function.outer",
                    ["]["] = "@class.outer",
                },
                goto_previous_start = {
                    ["[m"] = "@function.outer",
                    ["[["] = "@class.outer",
                },
                goto_previous_end = {
                    ["[M"] = "@function.outer",
                    ["[]"] = "@class.outer",
                },
            },
            swap = {
                enable = true,
                swap_next = {
                    ["<leader>a"] = "@parameter.inner",
                },
                swap_previous = {
                    ["<leader>A"] = "@parameter.inner",
                },
            },
        },
        -- https://github.com/windwp/nvim-ts-autotag
        autotag = {

            enable = true,
        },
    })
end

return M
