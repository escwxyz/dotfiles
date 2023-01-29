local M = {}

local path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension")

local codelldb_path = path .. "/adapter/codelldb"

local liblldb_path = path .. "/lldb/lib/liblldb.so" -- for linux

if vim.fn.has("mac") == 1 then
    liblldb_path = path .. "/lldb/lib/liblldb.dylib" -- for mac
end

local is_dap_ready = vim.fn.filereadable(codelldb_path) == 1
    and vim.fn.filereadable(liblldb_path) == 1

local opts = {
    server = {
        standalone = false,
        capabilities = require("plugins.lsp.capabilities"),
        on_attach = function(_, bufnr)
            require("plugins.lsp.on_attach")(_, bufnr)
            -- Hover actions
            vim.keymap.set(
                "n",
                "<leader>ah",
                "<cmd>RustHoverActions<CR>",
                { desc = "[RS] Hover", buffer = bufnr }
            )

            vim.keymap.set(
                "n",
                "<leader>ac",
                "<cmd>RustOpenCargo<CR>",
                { desc = "[RS] Open Cargo.toml", buffer = bufnr }
            )
            vim.keymap.set(
                "n",
                "<leader>ap",
                "<cmd>RustParentModule<CR>",
                { desc = "[RS] Parent module", buffer = bufnr }
            )
            -- Code action groups
            vim.keymap.set("n", "<leader>ar", function()
                require("rust-tools").code_action_group.code_action_group()
            end, { desc = "[RS] Actions", buffer = bufnr })
        end,
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = {
                    command = "clippy",
                },
            },
        },
    },
    tools = {
        executor = require("rust-tools.executors").termopen,
        on_initialized = nil,
        reload_workspace_from_cargo_toml = true,
        -- These apply to the default RustSetInlayHints command
        inlay_hints = {
            auto = true,
            only_current_line = false,
            show_parameter_hints = true,
            parameter_hints_prefix = "⥢  ",
            other_hints_prefix = "⥤  ",
            max_len_align = false,
            max_len_align_padding = 1,
            right_align = false,
            right_align_padding = 7,
            highlight = "Comment",
        },
        hover_actions = {
            auto_focus = true,
        },
    },
}
-- TODO it looks like dap was started together with rust-tools, which should be lazily loaded on demand
if is_dap_ready then
    opts.dap =
        { adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path) }
end

M.setup = function()
    require("rust-tools").setup(opts)
end

return M
