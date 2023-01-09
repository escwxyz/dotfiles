-- TODO color adjustment
-- TODO icons

local colors = require("catppuccin.palettes").get_palette("mocha")

local ViMode = {
    init = function(self)
        self.mode = vim.fn.mode(1)
        if not self.once then
            vim.api.nvim_create_autocmd("ModeChanged", {
                pattern = "*:*o",
                command = "redrawstatus",
            })
            self.once = true
        end
    end,
    static = {
        mode_names = {
            n = "NORMAL",
            no = "O-PENDING",
            nov = "O-PENDING",
            noV = "O-PENDING",
            ["no\22"] = "O-PENDING",
            niI = "NORMAL-I",
            niR = "NORMAL-R",
            niV = "NORMAL-VR",
            nt = "NORMAL-T",
            niT = "NORMAL-T",
            v = "VISUAL",
            vs = "VISUAL-S",
            V = "V-LINE",
            Vs = "V-LINE-S",
            ["\22"] = "V-BLOCK",
            ["\22s"] = "V-BLOCK-S",
            s = "SELECT",
            S = "S-LINE",
            ["\19"] = "S-BLOCK",
            i = "INSERT",
            ic = "INSERT",
            ix = "INSERT",
            R = "REPLACE",
            Rc = "REPLACE",
            Rx = "REPLACE",
            Rv = "REPLACE",
            Rvc = "V-REPLACE",
            Rvx = "V-REPLACE",
            c = "COMMAND",
            cv = "EX",
            ce = "EX",
            r = "HIT-ENTER",
            rm = "MORE",
            ["r?"] = "CONFIRM",
            ["!"] = "SHELL",
            t = "TERMINAL",
        },
        mode_colors = {
            n = "red",
            i = "green",
            v = "cyan",
            V = "cyan",
            ["\22"] = "cyan",
            c = "orange",
            s = "purple",
            S = "purple",
            ["\19"] = "purple",
            R = "orange",
            r = "orange",
            ["!"] = "red",
            t = "red",
        },
        mode_bg_colors = {
            n = "cyan",
            i = "purple",
            v = "red",
            V = "red",
            ["\22"] = "red",
            c = "blue",
            s = "green",
            S = "green",
            ["\19"] = "green",
            R = "blue",
            r = "blue",
            ["!"] = "cyan",
            t = "cyan",
        },
    },
    -- {
    --     provider = function()
    --         return ""
    --     end,
    --     hl = function(self)
    --         local mode = self.mode:sub(1, 1)
    --         return { fg = self.mode_bg_colors[mode], bold = true }
    --     end,
    -- },
    {
        provider = function(self)
            return "  " .. self.mode_names[self.mode]
        end,
        hl = function(self)
            local mode = self.mode:sub(1, 1)
            return { fg = "base", bg = self.mode_bg_colors[mode], bold = true }
        end,
        update = {
            "ModeChanged",
        },
    },
    {
        provider = "",
        hl = function(self)
            local mode = self.mode:sub(1, 1)
            return { fg = self.mode_bg_colors[mode], bold = true, bg = colors.surface1 }
        end,
    },
}

return ViMode
