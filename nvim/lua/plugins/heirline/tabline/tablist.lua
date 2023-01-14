local utils = require("heirline.utils")
local conditions = require("heirline.conditions")

local TabNummber = {
    provider = function(self)
        return "%" .. self.tabnr .. "T " .. self.tabnr .. " %T"
    end,
    hl = { italic = true },
}
local TabName = {
    init = function(self)
        self.is_terminal = conditions.buffer_matches({ buftype = { "terminal" } })

        local windows = vim.api.nvim_tabpage_list_wins(self.tabnr) -- all windows of that tabpage
        -- all unfloating wins inside that tabpage
        local unfloating_windows = vim.tbl_filter(function(winid)
            return vim.api.nvim_win_get_config(winid).relative == ""
        end, windows)

        local winid = vim.api.nvim_tabpage_get_win(self.tabnr) -- the "active" window of that tabpage

        local bufnr = vim.api.nvim_win_get_buf(winid)
        self.windows_count = #unfloating_windows
        self.filename = vim.api.nvim_buf_get_name(bufnr)
    end,
    -- Tabpage name
    {
        provider = function(self)
            if self.is_terminal then
                local tname, _ = self.filename:gsub(".*:", "") -- remove all .*:
                return " " .. tname-- remove string after first space
            else
                local filename = self.filename == "" and "[No Name]"
                    or vim.fn.fnamemodify(self.filename, ":t")

                return filename
            end
        end,
        hl = { bold = true },
    },
    -- window count
    {
        condition = function(self)
            return self.windows_count > 1
        end,
        provider = function(self)
            return " [" .. (self.windows_count - 1) .. "]"
        end,
        hl = "TabLine",
    },
}

local Tabpage = {
    {
        provider = function(self)
            return self.is_active and "  " or "  "
        end,
    },

    TabNummber,
    TabName,
    hl = function(self)
        if not self.is_active then
            return "TabLine"
        else
            return "TabLineSel"
        end
    end,
}

local TabPages = utils.make_tablist(Tabpage)
local TabList = {
    TabPages,
}

return TabList
