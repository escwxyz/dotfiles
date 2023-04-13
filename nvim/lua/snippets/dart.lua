return {

    s(
        {
            trig = "stateless",
        },
        fmta(
            [[
	class <name> extends StatelessWidget {
      const <name>({super.key});
		
      @override
	  Widget build(BuildContext context) {
		return const Placehoder();
      }
	}
	]],
            { name = i(1, "MyWidget") },
            { repeat_duplicates = true }
        )
    ),

    s(
        { trig = "riverpod" },
        fmt(
            [[
		@riverpod
		{type} {name}(Ref ref) {{
		  return {value};
		}}
		]],
            {
                type = i(1, "type"),
                name = i(2, "name"),
                value = i(3, "value"),
            }
        )
    ),
    s(
        { trig = "riverpodKeepAlive" },
        fmt(
            [[
		@Riverpod(keepAlive: true)
		{type} {name}(Ref ref) {{
		  return {value};
		}}
		]],
            {
                type = i(1, "type"),
                name = i(2, "name"),
                value = i(3, "value"),
            }
        )
    ),
    s(
        { trig = "riverpodFuture" },
        fmt(
            [[
		@riverpod
		FutureOr<{type}> {name}(Ref ref) {{
		  return {value};
		}}
		]],
            {
                type = i(1, "type"),
                name = i(2, "name"),
                value = i(3, "value"),
            }
        )
    ),
    s(
        { trig = "riverpodFutureKeepAlive" },
        fmt(
            [[
		@Riverpod(keepAlive: true)
		FutureOr<{type}> {name}(Ref ref) {{
		  return {value};
		}}
		]],
            {
                type = i(1, "type"),
                name = i(2, "name"),
                value = i(3, "value"),
            }
        )
    ),

    s(
        { trig = "riverpodClass" },
        fmt(
            [[
		@riverpod
		class {name} extends _${name} {{
		  @override
		  {type} build() {{
		    return {value};
		  }}
		}}
		]],
            {
                name = i(1, "name"),
                type = i(2, "type"),
                value = i(3, "value"),
            },
            {
                repeat_duplicates = true,
            }
        )
    ),
    s(
        { trig = "riverpodClassKeepAlive" },
        fmt(
            [[
		@Riverpod(keepAlive: true)
		class {name} extends _${name} {{
		  @override
		  {type} build() {{
		    return {value};
		  }}
		}}
		]],
            {
                name = i(1, "name"),
                type = i(2, "type"),
                value = i(3, "value"),
            },
            {
                repeat_duplicates = true,
            }
        )
    ),

    s(
        { trig = "riverpodAsyncClass" },
        fmt(
            [[
    @riverpod
    class {name} extends _${name} {{
      @override
      FutureOr<{type}> build() {{
        return {value};
      }}
    }}
    ]],
            {
                name = i(1, "name"),
                type = i(2, "type"),
                value = i(3, "value"),
            },
            {
                repeat_duplicates = true,
            }
        )
    ),
    s(
        { trig = "riverpodAsyncClassKeepAlive" },
        fmt(
            [[
    @Riverpod(keepAlive: true)
    class {name} extends _${name} {{
      @override
      FutureOr<{type}> build() {{
        return {value};
      }}
    }}
    ]],
            {
                name = i(1, "name"),
                type = i(2, "type"),
                value = i(3, "value"),
            },
            {
                repeat_duplicates = true,
            }
        )
    ),
    s(
        {
            trig = "consumer",
        },
        fmta([[
	Consumer(
	  builder: (context, ref, child){
		return <>;
	  }
	)
	]]),
        {
            i(1, "MyWidget"),
        }
    ),
}
