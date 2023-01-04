## Plugins

| Name                                                              | Description                   | Status |
| ----------------------------------------------------------------- | ----------------------------- | ------ |
| [folke/trouble.nvim](https://github.com/folke/trouble.nvim)       | Utils for LSP                 |        |
| [folke/lazy.nvim]()                                               | Plugin manager                | Done   |
| [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip)           | Snippet Engine                |        |
| [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)           | Completation engine           | Done   |
| hrsh7th/cmp-buffer                                                | for `nvim-cmp`                | Done   |
| hrsh7th/cmp-path                                                  | for `nvim-cmp`                | Done   |
| hrsh7th/cmp-cmdline                                               | for `nvim-cmp`                | Done   |
| hrsh7th/cmp-nvim-lsp                                              | for `nvim-cmp`                | Done   |
| [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Common functions for plugins  | Done   |
| saadparwaiz1/cmp_luasnip                                          | for `nvim-cmp` & `lunasnip`   | Done   |
| [williamboman/mason.nvim]()                                       | LSP server manager            | Done   |
| [williamboman/mason-lspconfig.nvim]()                             | for `mason`                   | Done   |
| [nvim-tree/nvim-web-devicons]()                                   | Icons                         | Done   |
| [nvim-treesitter/nvim-treesitter]()                               | Syntex Highlighting           |        |
| [gelguy/wilder.nvim]()                                            | CMD autocomplete              | Done   |
| [nvim-telescope/telescope.nvim]()                                 | General Finder                |        |
| nvim-telescope/telescope-fzf-native.nvim                          | Fuzzy support for `telescope` | Done   |

## Snippets

## TODOs

- properly set events for different plugins, see `:help events`
- write commonly used snippets for `rust`, `flutter / dart` and `typescript/tsx/react`
- config `dap`
- support fcitx5 in neovim
- ~~config `toggleterm`~~
- config vscode indent
- graphql / rest client for neovim
- unify shared icons for different plugins

## Notes

- Any operation that needs to be persistant, use hydra (not exit the panel); otherwise use which key
- Keybindings: <leader> first, then <Shift> / <CapsLock> & <Alt>, remove all <Ctrl>
