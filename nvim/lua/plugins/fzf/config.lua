local M = {}
--TODO adjust highlights
local colorschemes = {
    prompt = "Colorschemes> ",
    live_preview = true,
    actions = {
        ["default"] = function(selected)
            local colorscheme = selected[1]
            vim.cmd.colorscheme(colorscheme)
            require("utils").sad(
                "01",
                vim.g.Theme,
                colorscheme,
                "~/.config/nvim/lua/configs/colorscheme.lua"
            )
        end,
    },
    winopts = { height = 0.55, width = 0.30 },
    post_reset_cb = function()
        --TODO call heirline's on_colorscheme
    end,
}

local files = {
    prompt = "Files> ",
    multiprocess = true, -- run command in a separate process
    git_icons = true, -- show git icons?
    file_icons = true, -- show file icons?
    color_icons = true, -- colorize file|git icons
    -- path_shorten   = 1,              -- 'true' or number, shorten path?
    -- executed command priority is 'cmd' (if exists)
    -- otherwise auto-detect prioritizes `fd`:`rg`:`find`
    -- default options are controlled by 'fd|rg|find|_opts'
    -- NOTE: 'find -printf' requires GNU find
    -- cmd            = "find . -type f -printf '%P\n'",
    find_opts = [[-type f -not -path '*/\.git/*' -printf '%P\n']],
    rg_opts = "--color=never --files --hidden --follow -g '!.git'",
    fd_opts = "--color=never --type f --hidden --follow --exclude .git",
    -- by default, cwd appears in the header only if {opts} contain a cwd
    -- parameter to a different folder than the current working directory
    -- uncomment if you wish to force display of the cwd as part of the
    -- query prompt string (fzf.vim style), header line or both
    -- show_cwd_prompt = true,
    -- show_cwd_header = true,
}

local blines = {
    prompt = "BLines> ",
    show_unlisted = true, -- include 'help' buffers
    no_term_buffers = false, -- include 'term' buffers
    fzf_opts = {
        -- hide filename, tiebreak by line no.
        ["--delimiter"] = "'[\\]:]'",
        ["--with-nth"] = "2..",
        ["--tiebreak"] = "index",
    },
    -- actions inherit from 'actions.buffers' and merge
    -- actions = {
    --     ["default"] = actions.buf_edit_or_qf,
    --     ["alt-q"] = actions.buf_sel_to_qf,
    --     ["alt-l"] = actions.buf_sel_to_ll,
    -- },
}

local diagnostics = {
    prompt = "Diagnostics> ",
    cwd_only = false,
    file_icons = true,
    git_icons = false,
    diag_icons = true,
    icon_padding = "", -- add padding for wide diagnostics signs
    -- by default icons and highlights are extracted from 'DiagnosticSignXXX'
    -- and highlighted by a highlight group of the same name (which is usually
    -- set by your colorscheme, for more info see:
    --   :help DiagnosticSignHint'
    --   :help hl-DiagnosticSignHint'
    -- only uncomment below if you wish to override the signs/highlights
    -- define only text, texthl or both (':help sign_define()' for more info)
    signs = {
        ["Error"] = { text = "", texthl = "DiagnosticError" },
        ["Warn"] = { text = "", texthl = "DiagnosticWarn" },
        ["Info"] = { text = "", texthl = "DiagnosticInfo" },
        ["Hint"] = { text = "", texthl = "DiagnosticHint" },
    },
}

local git = {
    files = {
        prompt = "GitFiles> ",
        cmd = "git ls-files --exclude-standard",
        multiprocess = true, -- run command in a separate process
        git_icons = true, -- show git icons?
        file_icons = true, -- show file icons?
        color_icons = true, -- colorize file|git icons
        -- force display the cwd header line regardles of your current working
        -- directory can also be used to hide the header when not wanted
        -- show_cwd_header = true
    },
    status = {
        prompt = "GitStatus> ",
        -- consider using `git status -su` if you wish to see
        -- untracked files individually under their subfolders
        cmd = "git status -s",
        file_icons = true,
        git_icons = true,
        color_icons = true,
        previewer = "git_diff",
        actions = {
            -- actions inherit from 'actions.files' and merge
            -- ["right"] = { actions.git_unstage, actions.resume },
            -- ["left"] = { actions.git_stage, actions.resume },
        },
    },
    commits = {
        prompt = "Commits> ",
        cmd = "git log --color --pretty=format:'%C(yellow)%h%Creset %Cgreen(%><(12)%cr%><|(12))%Creset %s %C(blue)<%an>%Creset'",
        preview = "git show --pretty='%Cred%H%n%Cblue%an <%ae>%n%C(yellow)%cD%n%Cgreen%s' --color {1}",
        actions = {
            -- ["default"] = actions.git_checkout,
        },
    },
    bcommits = {
        prompt = "BCommits❯ ",
        -- default preview shows a git diff vs the previous commit
        -- if you prefer to see the entire commit you can use:
        --   git show --color {1} --rotate-to=<file>
        --   {1}    : commit SHA (fzf field index expression)
        --   <file> : filepath placement within the commands
        cmd = "git log --color --pretty=format:'%C(yellow)%h%Creset %Cgreen(%><(12)%cr%><|(12))%Creset %s %C(blue)<%an>%Creset' <file>",
        preview = "git diff --color {1}~1 {1} -- <file>",
        actions = {
            -- ["default"] = actions.git_buf_edit,
            -- ["ctrl-s"] = actions.git_buf_split,
            -- ["ctrl-v"] = actions.git_buf_vsplit,
            -- ["ctrl-t"] = actions.git_buf_tabedit,
        },
    },
    branches = {
        prompt = "Branches❯ ",
        cmd = "git branch --all --color",
        preview = "git log --graph --pretty=oneline --abbrev-commit --color {1}",
        actions = {
            -- ["default"] = actions.git_switch,
        },
    },
    stash = {
        prompt = "Stash> ",
        cmd = "git --no-pager stash list",
        preview = "git --no-pager stash show --patch --color {1}",
        actions = {
            -- ["default"] = actions.git_stash_apply,
            -- ["ctrl-x"] = { actions.git_stash_drop, actions.resume },
        },
        fzf_opts = {
            ["--no-multi"] = "",
            ["--delimiter"] = "'[:]'",
        },
    },
    icons = {
        ["M"] = { icon = "M", color = "yellow" },
        ["D"] = { icon = "D", color = "red" },
        ["A"] = { icon = "A", color = "green" },
        ["R"] = { icon = "R", color = "yellow" },
        ["C"] = { icon = "C", color = "yellow" },
        ["T"] = { icon = "T", color = "magenta" },
        ["?"] = { icon = "?", color = "magenta" },
    },
}

M.setup = function()
    local fzf = require("fzf-lua")
    -- local actions = require("fzf-lua.actions")
    fzf.setup({})
end

M.setup_cmds = function()
    local fzf = require("fzf-lua")
    vim.api.nvim_create_user_command("FindProjects", function()
        local cmd = "fd --type d . " .. "~/Projects" .. " " .. "~/.config"
        fzf.fzf_exec(cmd, {
            prompt = "Projects: ",
            fn_transform = function(x)
                return fzf.utils.ansi_codes.magenta(x)
            end,
            actions = {
                ["default"] = function(selected)
                    vim.cmd("cd " .. selected[1]) -- change working directory
                    vim.cmd(":enew") -- open an empty buffer in new directory
                end,
            },
        })
    end, {})
end

return M
