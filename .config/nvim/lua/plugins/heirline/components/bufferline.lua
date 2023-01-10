local utils = require("heirline.utils")

local TablineFileName = {
    provider = function(self)
        local filename = self.filename
        filename = filename == "" and "[No Name]" or vim.fn.fnamemodify(filename, ":t")
        return filename
    end,
    hl = function(self)
        return { bold = self.is_active or self.is_visible, italic = self.is_active }
    end,
}

local TablineFileFlags = {
    {
        condition = function(self)
            return vim.api.nvim_buf_get_option(self.bufnr, "modified")
        end,
        provider = " ● ",
        hl = { fg = "green" },
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
        hl = { fg = "yellow" },
    },
}

local FileIcon = require("plugins.heirline.components.file_icon")

local TablineFileNameBlock = {
    init = function(self)
        self.filename = vim.api.nvim_buf_get_name(self.bufnr)
    end,
    hl = function(self)
        if self.is_active then
            return "TabLineSel"
        else
            return "TabLine"
        end
    end,
    FileIcon,
    TablineFileName,
    TablineFileFlags,
}

local TablineBufferBlock = utils.surround({ "", "" }, function(self)
    if self.is_active then
        return utils.get_highlight("TabLineSel").bg
    else
        return utils.get_highlight("TabLine").bg
    end
end, { TablineFileNameBlock })

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
local BufferLine = utils.make_buflist(
    TablineBufferBlock,
    { provider = "", hl = { fg = "gray" } }, -- left truncation, optional (defaults to "<")
    { provider = "", hl = { fg = "gray" } } -- right trunctation, also optional (defaults to ...... yep, ">")
)

return BufferLine
