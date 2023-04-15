return {
    s({ trig = "dead" }, t("#[allow(dead_code)]")),

    s(
        { trig = "struct" },
        fmta(
            [[
           struct <> {
               <>
           }
       ]],
            { i(1, "name"), i(2, "") }
        )
    ),
    s(
        { trig = "impl" },
        fmta(
            [[
           impl <>  {
             <>
           }
       ]],
            { i(1, "name"), i(2, "") }
        )
    ),
    s(
        { trig = "enum" },
        fmta(
            [[
    enum <> {
    	<>
    }
    ]],
            { i(1, "name"), i(2, "") }
        )
    ),

    s(
        {
            trig = "dervie",
        },
        fmta(
            [[
    	#[derive(<>)]
    	struct <> {
    	  <>
    	}
    	]],
            {
                c(1, {
                    t("Serialize, Desrialize"),
                    t("Serialize"),
                    t("Desrialize"),
                    t("Debug, Clone"),
                    t("Clone"),
                    t("Debug"),
                    t("Copy"),
                    t("Display"),
                }),
                i(2, "name"),
                i(3, ""),
            }
        )
    ),
    -- crate specific
    s(
        {
            trig = "lazy",
        },
        fmta(
            [[
	lazy_static! {
		pub static ref <>: <> = <>;
	}
	]],
            {
                i(1, "name"),
                i(2, "type"),
                i(3, "body"),
            }
        )
    ),
    -- TODO axum handler
}
