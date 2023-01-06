local M = {}

M.setup = function()
    require("alternate-toggler").setup({
        alternates = {
            ["true"] = "false",
            ["True"] = "False",
            ["TRUE"] = "FALSE",
            ["Yes"] = "No",
            ["YES"] = "NO",
            ["1"] = "0",
            ["+"] = "-",
            ["==="] = "!==",
            ["=="] = "~=",
        },
    })
end

return M
