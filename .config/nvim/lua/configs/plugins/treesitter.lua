--- Syntax Highlight
--- ~~~~~~~~~~~~~~~~
--- https://github.com/nvim-treesitter/nvim-treesitter#quickstart

local M = {
    "nvim-treesitter/nvim-treesitter",
    dev = false,
    build = ":TSUpdate",
    event = "BufReadPost",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "RRethy/nvim-treesitter-textsubjects",
        "nvim-treesitter/nvim-treesitter-refactor",
        -- "mfussenegger/nvim-treehopper",
        { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
    },
    init = function()
        vim.cmd([[
            omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>
            xnoremap <silent> m :lua require('tsht').nodes()<CR>
          ]])
    end,
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "bash",
                "fish",
                "typescript",
                "rust",
                "css",
                "javascript",
                "html",
                "graphql",
                "toml",
                "yaml",
                "json"
            },
            highlight = {
                enable = true,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<c-space>", -- set to `false` to disable one of the mappings
                    node_incremental = "<c-space>",
                    scope_incremental = "<c-s>",
                    node_decremental = "<c-backspace>",
                },
            },
            -- TODO
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        -- You can optionally set descriptions to the mappings (used in the desc parameter of
                        -- nvim_buf_set_keymap) which plugins like which-key display
                        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                    },
                    -- You can choose the select mode (default is charwise 'v')
                    --
                    -- Can also be a function which gets passed a table with the keys
                    -- * query_string: eg '@function.inner'
                    -- * method: eg 'v' or 'o'
                    -- and should return the mode ('v', 'V', or '<c-v>') or a table
                    -- mapping query_strings to modes.
                    selection_modes = {
                        ['@parameter.outer'] = 'v', -- charwise
                        ['@function.outer'] = 'V', -- linewise
                        ['@class.outer'] = '<c-v>', -- blockwise
                    },
                }
            }
        })


	local key_map = function (keys, id, desc)
		local mapper = require("nvim-mapper")
		mapper.map_virtual({"n", "v"}, keys, "", {}, "Treesitter", id, "Treesitter" .. desc )
	end

        -- key_map.map_virtual()
    end
}


return M
