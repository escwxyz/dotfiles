## Plugins (sort by alphabet)

- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) - Use buffer as cmp source
- [cmp-path](https://github.com/hrsh7th/cmp-path) - Use filesystem paths as cmp source
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) - Use LSP as cmp source
- [cmp-tabnine](https://github.com/tzachar/cmp-tabnine) - Use tabnine as cmp source
- [dressing.nvim](https://github.com/stevearc/dressing.nvim) - Improve default neovim UI
- [focus.nvim](https://github.com/beauwilliams/focus.nvim) - Window management
- [FTerm](https://github.com/numToStr/FTerm.nvim) - Floating terminal
- [fzf-lua](https://github.com/ibhagwan/fzf-lua) - Fuzzy finder based on fzf
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Git status signs
- [heirline.nvim](https://github.com/rebelot/heirline.nvim) - For building statusline, winbar and tabline
- [hydra.nvim](https://github.com/anuvyklack/hydra.nvim) - Submodule menu
- [lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager
- [leap.nvim](https://github.com/ggandor/leap.nvim) - In vision cursor navigation
- [lspkind.nvim](https://github.com/onsails/lspkind.nvim) - Vscode like icons for cmp
- [Luasnip](https://github.com/L3MON4D3/LuaSnip) - Snippet engine
- [mason.nvim](https://github.com/williamboman/mason.nvim) - Manage LSP & DAP servers, format tools etc.
- [mini.animate](https://github.com/echasnovski/mini.animate) - Cursor animation
- [mini.bufremove](https://github.com/echasnovski/mini.bufremove) - Persist window layout after removing buffer
- [mini.comment](https://github.com/echasnovski/mini.comment) - Comment
- [neogen](https://github.com/danymat/neogen) - Annotation
- [neotest](https://github.com/nvim-neotest/neotest) - Test engine
- [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) - Formatting & Code actions, etc.
- [nvim-base16](https://github.com/rrethy/nvim-base16) - Colorschemes
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Completion engine
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - For configuring LSP clients
- [nvim-neoclip](https://github.com/AckslD/nvim-neoclip.lua) - Yank history
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Treesitter for syntex highlighting and more
- [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) - Autotag for tsx etc.
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) - Icons
- [oil.nvim](https://github.com/stevearc/oil.nvim) - File explorer
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) - Utils for many plugins
- [ts-node-action](https://github.com/ckolkey/ts-node-action) - Node actions based on treesitter
- [urlview.nvim](https://github.com/axieax/urlview.nvim) - Open / copy urls from plugin manager, or within buffer
- [vmux](https://github.com/yazgoo/vmux) - Terminal multiplexing
- [which-key.nvim](https://github.com/folke/which-key.nvim) - Keymaps utility
- [zen-mode.nvim](https://github.com/folke/zen-mode.nvim) - Distraction-free UI for writing

## Keybindings

- `/` Search inside current buffer via fzf-lua

- `<leader>a`
- `<leader>b` Choose buffers via fzf-lua
- `<leader>c` Choose commands via fzf-lua
- `<leader>f` Find files via fzf-lua
- `<leader>g` Lazygit via FTerm
- `<leader>h` Split window left
- `<leader>i`
- `<leader>j` Split window down
- `<leader>k` Split window up
- `<leader>l` Split window right
- `<leader>m`
- `<leader>n` Annotations
- `<leader>o` Oil file / folder manipulation
- `<leader>p` Switching projects via fzf-lua
- `<leader>q` Quit current buffer
- `<leader>r` Refactor selected code /
- `<leader>t` Toggle editor options
- `<leader>u`
- `<leader>v` Vmux split vertically
- `<leader>y` Yank history
- `<leader>z` Toggle Zen Mode
- `<leader>?` Help tags via fzf-lua
- `<leader>/` Find keymaps via fzf-lua
- `<leader>\\` Lazy plugins

## Snippets

## TODOs

- [x] properly set events for different plugins, see `:help events`
- [ ] write commonly used snippets for `rust`, `flutter / dart` and `typescript/tsx/react`
- [ ] config `dap`
- [ ] config vscode like indent
- [ ] graphql / rest client for neovim
- [ ] unify shared icons for different plugins
- [ ] unify builtin ui with dressing.nvim
- [ ] hydra freezes statusline
- [x] fully remove noice
- [ ] use fzf-lua to replace telescope
- [ ] Batch rename
- [ ] Add dial.nvim
- [ ] Reduce startup time (currently between 50 - 100 ms, on M1 Max)
