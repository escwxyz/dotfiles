-- Comment Plugin
-- ~~~~~~~~~~~~~~
-- https://github.com/numToStr/Comment.nvim

local M = {}

M.setup = function()
    require("Comment").setup({
        padding = true,
        sticky = true,
        mappings = {
            basic = false,
            extra = false,
        },
        ---Function to call before (un)comment
        --pre_hook = nil,
        ---Function to call after (un)comment
        post_hook = function(ctx)
            vim.lsp.buf.format()
        end,
    })
end

-- local api = require("Comment.api")
-- local config = require("Comment.config"):get()
--
-- M.comment_line = function(mode)
--     if mode == "n" then
--         return vim.v.count == 0 and "<Plug>(comment_toggle_linewise_current)"
--             or "<Plug>(comment_toggle_linewise_count)"
--     elseif mode == "x" then
--         return "<Plug>(comment_toggle_linewise_visual)"
--     end
-- end
--
return M
