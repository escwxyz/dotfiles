local M = {}

-- local function notify_output(command, opts)
--     local output = ""
--     local notification
--     local notify = function(msg, level)
--         local notify_opts = vim.tbl_extend(
--             "keep",
--             opts or {},
--             { title = table.concat(command, " "), replace = notification }
--         )
--         notification = vim.notify(msg, level, notify_opts)
--     end
--     local on_data = function(_, data)
--         output = output .. table.concat(data, "\n")
--         notify(output, "info")
--     end
--     vim.fn.jobstart(command, {
--         on_stdout = on_data,
--         on_stderr = on_data,
--         on_exit = function(_, code)
--             if #output == 0 then
--                 notify("No output of command, exit code: " .. code, "warn")
--             end
--         end,
--     })
-- end

-- Utility functions shared between progress reports for LSP and DAP

local client_notifs = {}

M.get_notif_data = function(client_id, token)
    if not client_notifs[client_id] then
        client_notifs[client_id] = {}
    end

    if not client_notifs[client_id][token] then
        client_notifs[client_id][token] = {}
    end

    return client_notifs[client_id][token]
end

M.spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }

M.update_spinner = function(client_id, token)
    local notif_data = M.get_notif_data(client_id, token)

    if notif_data.spinner then
        local new_spinner = (notif_data.spinner + 1) % #M.spinner_frames
        notif_data.spinner = new_spinner

        notif_data.notification = vim.notify(nil, nil, {
            hide_from_history = true,
            icon = M.spinner_frames[new_spinner],
            replace = notif_data.notification,
        })

        vim.defer_fn(function()
            M.update_spinner(client_id, token)
        end, 100)
    end

end

M.format_title = function(title, client_name)
    return client_name .. (#title > 0 and ": " .. title or "")
end

M.format_message = function(message, percentage)
    return (percentage and percentage .. "%\t" or "") .. (message or "")
end


return M
