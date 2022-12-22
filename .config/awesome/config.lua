return {
    theme_name = "catppuccin",
    theme_style = "mocha",
    theme_switch_integration = false, -- match themes for different apps
    displayed_themes         = {
        ["catppuccin"] = true,
        ["nord"] = true,
        ["tokyonight"] = true,
    },
    goals                    = {
        "Update config",
        "Post to r/unixporn",
        "Be kind to myself",
    },
    ledger                   = {
        ledger_file = "~/.config/awesome/misc/sample.ledger",
        budget_file = "~/.config/awesome/misc/budget.ledger",
    },
    pomo                     = {
        topics = {
            "School",
            "Personal",
            "Hobby",
            "Rice",
        },
    },
    pixela                   = {
        user  = "",
        token = "",
    },
    titles                   = {
        "Mechromancer",
        "Open sourcerer",
        "Vim wizard",
        "CLI sorcerer",
        "Uses Arch, btw",
    },
    habit                    = {
        -- graph id         display name    frequency
        ["make-bed"]   = { "Make bed", "daily" },
        ["journal"]    = { "Journal", "daily" },
        ["go-outside"] = { "Touch grass", "daily" },
        ["ledger"]     = { "Ledger", "daily" },
        ["pomocode"]   = { "Coding", "daily" },
        ["reading"]    = { "Read", "daily" },
    },
    git                      = {
        {
            name = "",
            repo = "",
            msg = "",
        },
    }
}
