--- Syntax Highlight
--- ~~~~~~~~~~~~~~~~
--- See https://github.com/nvim-treesitter/nvim-treesitter#quickstart

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
            }
        })
    end
}


return M
