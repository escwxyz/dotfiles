local Time = {

    init = function(self)
        local stats = require("lazy").stats()
        self.startuptime = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        self.up_time = os.difftime(os.time(), _G.init_time)
    end,

    {
        provider = "",
        -- hl = { fg = colors.surface0, bg = colors.mantle },
    },
    -- StartUpTime
    {
        provider = function(self)
            return " " .. self.startuptime .. " ms"
        end,
        hl = { fg = "orange" },
        condition = function(self)
            return self.up_time <= 10
        end,
    },
    -- UpTime
    {
        provider = function(self)
            return " ⏱  "
                .. string.format(
                    "%.2d:%.2d:%.2d",
                    self.up_time / (60 * 60),
                    self.up_time / 60 % 60,
                    self.up_time % 60
                )
        end,
        hl = function(self)
            return self.up_time >= 1800 and { fg = "yellow" } or { fg = "white" }
        end,
    },
    -- Current Time
    {
        provider = function()
            return " " .. os.date("%H:%M") .. " "
        end,
        hl = { bold = true },
    },
}

return Time
