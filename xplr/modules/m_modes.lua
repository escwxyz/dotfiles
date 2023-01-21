local M = {}
---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

local modes = xplr.config.modes

M.setup_default = function()
    modes.builtin.default = {
        name = "default",
        key_bindings = {
            on_key = {
                ["#"] = {
                    messages = {
                        "PrintAppStateAndQuit",
                    },
                },
                ["."] = {
                    help = "show hidden",
                    messages = {
                        {
                            ToggleNodeFilter = {
                                filter = "RelativePathDoesNotStartWith",
                                input = ".",
                            },
                        },
                        "ExplorePwdAsync",
                    },
                },
                [":"] = {
                    help = "action",
                    messages = {
                        "PopMode",
                        { SwitchModeBuiltin = "action" },
                    },
                },
                ["?"] = {
                    help = "global help menu",
                    messages = {
                        {
                            BashExec = [===[
              [ -z "$PAGER" ] && PAGER="less -+F"
              cat -- "${XPLR_PIPE_GLOBAL_HELP_MENU_OUT}" | ${PAGER:?}
            ]===],
                        },
                    },
                },
                ["G"] = {
                    help = "go to bottom",
                    messages = {
                        "PopMode",
                        "FocusLast",
                    },
                },
                ["ctrl-a"] = {
                    help = "select/unselect all",
                    messages = {
                        "ToggleSelectAll",
                    },
                },
                ["ctrl-f"] = {
                    help = "search",
                    messages = {
                        "PopMode",
                        { SwitchModeBuiltin = "search" },
                        { SetInputBuffer = "" },
                    },
                },
                ["ctrl-i"] = {
                    help = "next visited path",
                    messages = {
                        "NextVisitedPath",
                    },
                },
                ["ctrl-o"] = {
                    help = "last visited path",
                    messages = {
                        "LastVisitedPath",
                    },
                },
                ["ctrl-r"] = {
                    help = "refresh screen",
                    messages = {
                        "ClearScreen",
                    },
                },
                ["ctrl-u"] = {
                    help = "clear selection",
                    messages = {
                        "ClearSelection",
                    },
                },
                ["ctrl-w"] = {
                    help = "switch layout",
                    messages = {
                        { SwitchModeBuiltin = "switch_layout" },
                    },
                },
                ["d"] = {
                    help = "delete",
                    messages = {
                        "PopMode",
                        { SwitchModeBuiltin = "delete" },
                    },
                },
                ["down"] = {
                    help = "down",
                    messages = {
                        "FocusNext",
                    },
                },
                ["enter"] = {
                    help = "open with editor",
                    messages = {
                        {
                            BashExec0 = [===[
              ${EDITOR:-vi} "${XPLR_FOCUS_PATH:?}"
            ]===],
                        },
                        "PopMode",
                    },
                },
                ["f"] = {
                    help = "filter",
                    messages = {
                        "PopMode",
                        { SwitchModeBuiltin = "filter" },
                    },
                },
                ["g"] = {
                    help = "go to",
                    messages = {
                        "PopMode",
                        { SwitchModeBuiltin = "go_to" },
                    },
                },
                ["left"] = {
                    help = "back",
                    messages = {
                        "Back",
                    },
                },
                ["q"] = {
                    help = "quit",
                    messages = {
                        "Quit",
                    },
                },
                ["r"] = {
                    help = "rename",
                    messages = {
                        "PopMode",
                        { SwitchModeBuiltin = "rename" },
                        {
                            BashExecSilently0 = [===[
              NAME=$(basename "${XPLR_FOCUS_PATH:?}")
              "$XPLR" -m 'SetInputBuffer: %q' "${NAME:?}"
            ]===],
                        },
                    },
                },
                ["ctrl-d"] = {
                    help = "duplicate as",
                    messages = {
                        "PopMode",
                        { SwitchModeBuiltin = "duplicate_as" },
                        {
                            BashExecSilently0 = [===[
              NAME=$(basename "${XPLR_FOCUS_PATH:?}")
              "$XPLR" -m 'SetInputBuffer: %q' "${NAME:?}"
            ]===],
                        },
                    },
                },
                ["right"] = {
                    help = "enter",
                    messages = {
                        "Enter",
                    },
                },
                ["s"] = {
                    help = "sort",
                    messages = {
                        "PopMode",
                        { SwitchModeBuiltin = "sort" },
                    },
                },
                ["space"] = {
                    help = "toggle selection",
                    messages = {
                        "ToggleSelection",
                        "FocusNext",
                    },
                },
                ["up"] = {
                    help = "up",
                    messages = {
                        "FocusPrevious",
                    },
                },
                ["~"] = {
                    help = "go home",
                    messages = {
                        {
                            BashExecSilently0 = [===[
              "$XPLR" -m 'ChangeDirectory: %q' "${HOME:?}"
            ]===],
                        },
                    },
                },
                ["page-up"] = {
                    help = "scroll up",
                    messages = {
                        "ScrollUp",
                    },
                },
                ["page-down"] = {
                    help = "scroll down",
                    messages = {
                        "ScrollDown",
                    },
                },
                ["{"] = {
                    help = "scroll up half",
                    messages = {
                        "ScrollUpHalf",
                    },
                },
                ["}"] = {
                    help = "scroll down half",
                    messages = {
                        "ScrollDownHalf",
                    },
                },
            },
            on_number = {
                help = "input",
                messages = {
                    "PopMode",
                    { SwitchModeBuiltin = "number" },
                    "BufferInputFromKey",
                },
            },
        },
    }
end

return M
