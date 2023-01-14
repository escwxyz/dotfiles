local M = {}

local utils = require("heirline.utils")

local FileName = {
    provider = function(self)
        local filename = self.filename -- from the parent
        filename = filename == "" and "[No Name]" or vim.fn.fnamemodify(filename, ":t")
        -- TODO limit the length
        return filename
    end,
    hl = function(self)
        return { bold = self.is_active or self.is_visible, italic = self.is_active }
    end,
}

local FileFlags = {
    {
        condition = function(self)
            return vim.api.nvim_buf_get_option(self.bufnr, "modified")
        end,
        provider = " ● ",
    },
    {
        condition = function(self)
            return not vim.api.nvim_buf_get_option(self.bufnr, "modifiable")
                or vim.api.nvim_buf_get_option(self.bufnr, "readonly")
        end,
        provider = function(self)
            if vim.api.nvim_buf_get_option(self.bufnr, "buftype") == "terminal" then
                return "  "
            else
                return ""
            end
        end,
        hl = { fg = "text_highlight" },
    },
}

local FileIcon = require("plugins.heirline.shared.file_icon")
-- TODO
local BufferBlock = {
    init = function(self)
        self.filename = vim.api.nvim_buf_get_name(self.bufnr)
    end,
    hl = function(self)
        return self.is_active
                and {
                    fg = utils.get_highlight("TabLineSel").fg,
                    bg = utils.get_highlight("Normal").bg,
                }
            or "TabLine"
    end,
    {
        provider = " ",
        hl = function(self)
            return self.is_active
                    and {
                        fg = utils.get_highlight("Normal").bg,
                        bg = utils.get_highlight("TabLine").bg,
                    }
                or {
                    fg = utils.get_highlight("TabLine").bg,
                    bg = utils.get_highlight("TabLine").bg,
                }
        end,
    },
    FileIcon,
    FileName,
    FileFlags,
    {
        provider = " ",
        hl = function(self)
            return self.is_active
                    and {
                        fg = utils.get_highlight("Normal").bg,
                        bg = utils.get_highlight("TabLine").bg,
                    }
                or {
                    fg = utils.get_highlight("TabLine").bg,
                    bg = utils.get_highlight("TabLine").bg,
                }
        end,
    },
}
-- local TablinePicker = {
--     condition = function(self)
--         return self._show_picker
--     end,
--     init = function(self)
--         local bufname = vim.api.nvim_buf_get_name(self.bufnr)
--         bufname = vim.fn.fnamemodify(bufname, ":t")
--         local label = bufname:sub(1, 1)
--         local i = 2
--         while self._picker_labels[label] do
--             if i > #bufname then
--                 break
--             end
--             label = bufname:sub(i, i)
--             i = i + 1
--         end
--         self._picker_labels[label] = self.bufnr
--         self.label = label
--     end,
--     provider = function(self)
--         return self.label
--     end,
--     hl = { fg = "red", bold = true },
-- }
--
local BufferLine = utils.make_buflist(BufferBlock)

M.BufferLine = BufferLine
M.FileName = FileName

return M
