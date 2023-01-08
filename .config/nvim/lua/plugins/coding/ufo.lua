--- Fold Code
--- ~~~~~~~~~
--- https://github.com/kevinhwang91/nvim-ufo#quickstart

--WARNING it cannot fold/unfold specific block

local M = {}

M.setup = function()
    require("ufo").setup({
        provider_selector = function(bufnr, filetype, buftype)
            return { "treesitter", "indent" }
        end,
        open_fold_hl_timeout = 150,
        close_fold_kinds = { "imports", "comment" },
        preivew = { -- preview window
            win_config = {
                border = { "", "─", "", "", "", "─", "", "" },
                winhighlight = "Normal:Folded",
                winblend = 0,
            },
        },
        fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
            local newVirtText = {}
            local suffix = ("  %d "):format(endLnum - lnum)
            local sufWidth = vim.fn.strdisplaywidth(suffix)
            local targetWidth = width - sufWidth
            local curWidth = 0
            for _, chunk in ipairs(virtText) do
                local chunkText = chunk[1]
                local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                if targetWidth > curWidth + chunkWidth then
                    table.insert(newVirtText, chunk)
                else
                    chunkText = truncate(chunkText, targetWidth - curWidth)
                    local hlGroup = chunk[2]
                    table.insert(newVirtText, { chunkText, hlGroup })
                    chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    -- str width returned from truncate() may less than 2nd argument, need padding
                    if curWidth + chunkWidth < targetWidth then
                        suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
                    end
                    break
                end
                curWidth = curWidth + chunkWidth
            end
            table.insert(newVirtText, { suffix, "MoreMsg" })
            return newVirtText
        end,
    })
end

local function goPreviousClosedAndPeek()
    require("ufo").goPreviousClosedFold()
    require("ufo").peekFoldedLinesUnderCursor()
end

local function goNextClosedAndPeek()
    require("ufo").goNextClosedFold()
    require("ufo").peekFoldedLinesUnderCursor()
end

M.setup_cmds = function()
    vim.api.nvim_create_user_command("UFOOpenAllFolds", function()
        require("ufo").openAllFolds()
        require("caskey").emit("AllFoldsOpened")
    end, {})
    vim.api.nvim_create_user_command("UFOCloseAllFolds", function()
        require("ufo").closeAllFolds()
        require("caskey").emit("AllFoldsClosed")
    end, {})
    vim.api.nvim_create_user_command("UFOGoNextClosedAndPeak", goNextClosedAndPeek, {})
    vim.api.nvim_create_user_command("UFOGoPrevClosedAndPeak", goPreviousClosedAndPeek, {})
end

return M
