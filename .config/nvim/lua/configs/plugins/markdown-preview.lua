--- Markdown File Preview on localhost
--- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--- See https://github.com/iamcco/markdown-preview.nvim

local M = {
    "iamcco/markdown-preview.nvim",
    cmd = "MarkdownPreview", -- Only load on CMD:MarkdownPreview
    ft = "markdown",
    build = function()
        vim.fn["mkdp#util#install"]()
    end,
    config = function()
        vim.g.mkdp_filetypes = { "markdown" }
    end
}

return M
