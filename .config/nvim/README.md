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
- noice lsp status overlap lualine
- unify ui with dressing.nvim
- hydra freezes statusline
- statusline is blinking when jumping between themes (not selected)
## Notes

- Any operation that needs to be persistant, use hydra (not exit the panel); otherwise use which key
- Keybindings: `<leader>` first, then `<Shift>` / `<CapsLock>` & `<Alt>`, remove all `<Ctrl>`

## Keybindings

### modules (starts with `<leader>` in normal mode)

- `<leader>a` => Actions
- `<leader>b` => Hydra Buffer (by `bufferline`)
- `<leader>c` => Command Palette (by `Legendary`)
- `<leader>d` => Debug UI
- `<leader>e` => File Explorer (by `nnn`)
- `<leader>f` => Fuzzy Finder (by `Telescope`)
- `<leader>g` => Git (Hydra, by `diffview`, `gitsigns`, `gitui`)
- `<leader>h` => 
- `<leader>i` =>
- `<leader>j` => Job Manager (by `overseer`)
- `<leader>k` => Keybindings (by `WhichKey`)
- `<leader>l` => URL Viewer (Hydra, by `UrlViewer`) 
- `<leader>m` => Marks (Hydra, by `harpoon`)
- `<leader>n` => 
- `<leader>o` => Global Editor Options (Hydra)
- `<leader>p` => Plugin Manager (by `Lazy.nvim`) 
- `<leader>q` => QuickFix (by bqf)
- `<leader>r` =>
- `<leader>s` => Session
- `<leader>t` =>
- `<leader>u` => Undotree (by `Undotree`)
- `<leader>v` => 
- `<leader>w` => Windows Management (Hydra, by `windows`, `smart-split`)
- `<leader>x` => 
- `<leader>y` => Yank (Hydra, by `yanky`)
- `<leader>z` =>

### actions (<alt>/<Shift>)

### actions (other)

- `s` => Leap search current window
- `S` => Leap search cross window

