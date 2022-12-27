--- Fold Code
--- ~~~~~~~~~
--- https://github.com/kevinhwang91/nvim-ufo#quickstart

-- TODO hide signs https://github.com/kevinhwang91/nvim-ufo/issues/4

return {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    event = "VeryLazy",
    config = function()
        vim.o.foldcolumn = '1' -- '0' is not bad
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true

        require("ufo").setup({
            close_fold_kinds = { 'imports', 'comment' },
            fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
                local newVirtText = {}
                local suffix = ('  %d '):format(endLnum - lnum)
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
                            suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
                        end
                        break
                    end
                    curWidth = curWidth + chunkWidth
                end
                table.insert(newVirtText, { suffix, 'MoreMsg' })
                return newVirtText
            end
        })

        local Hydra = require("hydra")

        vim.keymap.set("n", "zo", require("ufo").openAllFolds, { silent = true, desc = "Open All Folds" })
        vim.keymap.set("n", "zc", require("ufo").closeAllFolds, { silent = true, desc = "Close All Folds" })

        vim.keymap.set("n", "zz", function()

        end)

        Hydra({
            name = "UFO",
            config = {
                invoke_on_body = true,
                hint = {
                    type = "statusline",
                }
            },
            mode = "n",
            body = "z",
            heads = {
                { "O", require("ufo").openAllFolds, { desc = "Open All Folds" } },
                { "C", require("ufo").closeAllFolds, { desc = "Close All Folds" } },
                { "<Esc>", nil, { exit = true } }
            }

        })

    end
}
