-- TODO color adjustment
-- TODO icons

local ViMode = {
    init = function(self)
        self.mode = vim.fn.mode(1)
        -- if not self.once then
        --     vim.api.nvim_create_autocmd("ModeChanged", {
        --         pattern = "*:*o",
        --         command = "redrawstatus",
        --     })
        --     self.once = true
        -- end
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
        mode_bg_colors = {
            n = "blue",
            i = "green",
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
    hl = { bg = "background_nc" }, -- NOTE this must be the same with the background color of the next component
    {
        provider = function(self)
            return "  " .. self.mode_names[self.mode]
        end,
        hl = function(self)
            local mode = self.mode:sub(1, 1)
            return {
                fg = (mode == "t" or mode == "!") and "black" or "white",
                bg = self.mode_bg_colors[mode],
                bold = true,
            }
        end,
        update = {
            "ModeChanged",
        },
    },
    {
        provider = "",
        hl = function(self)
            local mode = self.mode:sub(1, 1)
            return { fg = self.mode_bg_colors[mode] }
        end,
    },
}

return ViMode
