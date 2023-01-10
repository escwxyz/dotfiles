local colors = require("catppuccin.palettes").get_palette("mocha")

local function get_listed_buffers()
    local bufferlist = {}
    local listed_buffers = vim.fn.getbufinfo({ buflisted = 1 })
    for _, value in ipairs(listed_buffers) do
        table.insert(bufferlist, value.bufnr)
    end

    return bufferlist
end

local Buffers = {
    init = function(self)
        self.bufferlist = get_listed_buffers()
        self.current_buffer = vim.api.nvim_get_current_buf()
        self.current_index = require("utils").indexOf(self.bufferlist, self.current_buffer)
        self.previous_index = self.current_index - 1
        self.next_index = self.current_index + 1
        self.current_at_start = self.current_index == 1
        self.current_at_last = self.current_index == #self.bufferlist
        self.next_buffer = not self.current_at_last and self.bufferlist[self.next_index] or nil
        self.prev_buffer = not self.current_at_start and self.bufferlist[self.previous_index] or nil
    end,
    {
        provider = function(self)
            if self.prv_buffer ~= nil then
                return tostring(self.prv_buffer)
            else
                return tostring(self.current_buffer)
            end
        end,
        condition = function(self)
            return self.bufferlist ~= nil
        end,

        hl = function(self)
            return {
                fg = self.current_at_start and colors.yellow or colors.text,
                bold = self.current_at_start,
            }
        end,
    },
    {
        provider = ", ",
        condition = function(self)
            return #self.bufferlist >= 2
        end,
    },
    {
        provider = function(self)
            if self.current_at_start then
                return tostring(self.bufferlist[self.next_index])
            elseif self.current_at_last then
                return tostring(self.bufferlist[self.previous_index])
            else
                return self.current_buffer
            end
        end,

        condition = function(self)
            return self.bufferlist ~= nil and #self.bufferlist >= 2
        end,

        hl = function(self)
            return {
                fg = not self.current_at_start and colors.yellow or colors.text,
                bold = not self.current_at_start,
            }
        end,
    },
    {
        provider = ", ",
        condition = function(self)
            return #self.bufferlist >= 3
        end,
    },
    {
        provider = function(self)
            if self.next_buffer ~= nil then
                return tostring(self.next_buffer)
            else
                return tostring(self.current_buffer)
            end
        end,
        condition = function(self)
            return #self.bufferlist >= 3
        end,
        hl = function(self)
            return {
                fg = self.current_at_last and colors.yellow or colors.text,
                bold = self.current_at_last,
            }
        end,
    },
    update = "BufEnter",
}

return Buffers
