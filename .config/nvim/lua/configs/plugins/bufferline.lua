--- BufferLine
--- ~~~~~~~~~~
--- https://github.com/akinsho/bufferline.nvim

return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    config = function()
        require('bufferline').setup {
            options = {
                mode = "buffers", -- set to "tabs" to only show tabpages instead
                numbers = "none",
                buffer_close_icon = '',
                modified_icon = '●',
                close_icon = '',
                left_trunc_marker = '',
                right_trunc_marker = '',
                max_name_length = 18,
                max_prefix_length = 15,
                truncate_names = true,
                tab_size = 18,
                diagnostics = "nvim_lsp",
                diagnostics_update_in_insert = false,
                -- TODO diagnostics
                -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
                -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
                --     return "(" .. count .. ")"
                -- end,
                -- NOTE: this will be called a lot so don't do any heavy processing here
                -- custom_filter = function(buf_number, buf_numbers)
                --     -- filter out filetypes you don't want to see
                --     if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
                --         return true
                --     end
                --     -- filter out by buffer name
                --     if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
                --         return true
                --     end
                --     -- filter out based on arbitrary rules
                --     -- e.g. filter out vim wiki buffer from tabline in your work repo
                --     if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
                --         return true
                --     end
                --     -- filter out by it's index number in list (don't show first buffer)
                --     if buf_numbers[1] ~= buf_number then
                --         return true
                --     end
                -- end,
                color_icons = true, -- whether or not to add the filetype icon highlights
                show_buffer_icons = true, -- disable filetype icons for buffers
                show_buffer_close_icons = false,
                show_buffer_default_icon = false, -- whether or not an unrecognised filetype should show a default icon
                show_close_icon = false,
                show_tab_indicators = true,
                show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
                persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
                -- can also be a table containing 2 custom separators
                -- [focused and unfocused]. eg: { '|', '|' }
                separator_style = "thick",
                -- enforce_regular_tabs = false | true,
                -- sort_by = 'insert_after_current' | 'insert_at_end' | 'id' | 'extension' | 'relative_directory' |
                --     'directory' | 'tabs' | function(buffer_a, buffer_b)
                --         -- add custom logic
                --         return buffer_a.modified > buffer_b.modified
                --     end
            }
        }

        --TODO Keymapping

        local key_map = function(keys, cmd, unique_identifier, description)
            local mapper = require("nvim-mapper")
            mapper.map("n", keys, cmd, { silent = true }, "Buffer", unique_identifier, description)
        end


        key_map("<S-h>", "<cmd>:BufferLineCyclePrev<cr>", "go_to_previous_buffer",
            "Go to [P]revious Buffer")
        key_map("<S-l>", "<cmd>:BufferLineCycleNext<cr>", "go_to_next_buffer",
            "Go to [N]ext Buffer")

        key_map("q", "<cmd>:bdelete<cr>", "quit_buffer_without_save", "[Q]uit current buffer without save")
        key_map("<S-q>", "<cmd>:wq<cr>", "quit_buffer_with_save", "[Q]uit current buffer and save changes")

        -- vim.keymap.set("n", "q", "<cmd>:bdelete<CR>", { desc = "[Q]uit current buffer" })
        -- vim.keymap.set("n", "<S-q>", "<cmd>:bdelete %<CR>", { desc = "[Q]uit All Buffer" })

    end
}
