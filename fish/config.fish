fish_vi_key_bindings

set -l os (uname)

switch (uname -s)
    case Darwin
        abbr --add --global z zellij

        set -gx HOME /Users/jiewang
        set CARGO "$HOME/.cargo/bin"
        set SQLITE /opt/homebrew/opt/sqlite/bin
        set SOLANA "$HOME/solana/bin"
        set HOMEBREW /opt/homebrew/bin
        set -gx PNPM_HOME /Users/jiewang/Library/pnpm
        if not string match -q -- $PNPM_HOME $PATH
            set -gx PATH "$PNPM_HOME" $PATH
        end
        set SYSTEM "/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/Library/Apple/usr/bin:/usr/local/go/bin"
        set WEZTERM "/Applications/WezTerm.app/Contents/MacOS"
        set NEOVIDE "/Applications/Neovide.app/Contents/MacOS"
        set NPM "$PNPM_HOME/npm"
        set POSTGRESQL /Library/PostgreSQL/14/bin/
        # set ZIG "$HOME/Downloads/zig"
        set FLUTTER "$HOME/Development/flutter/bin"
        set NEOVIM "$HOME/Development/nvim-macos/bin"
        set NAIVE "$HOME/Downloads/naive"
        set -gx PATH "$NAIVE:$NEOVIM:$FLUTTER:$POSTGRESQL:$NPM:$HOMEBREW:$CARGO:$SOLANA:$PNPM_HOME:$SQLITE:$WEZTERM:$NEOVIDE:$SYSTEM"

        set -gx LDFLAGS -L/opt/homebrew/opt/sqlite/lib
        set -gx CPPFLAGS -I/opt/homebrew/opt/sqlite/include
        set -gx PKG_CONFIG_PATH /opt/homebrew/opt/sqlite/lib/pkgconfig


        # set -gx PUB_HOSTED_URL "https://pub.flutter-io.cn"
        # set -gx FLUTTER_STORAGE_BASE_URL "https://storage.flutter-io.cn"

    case Linux

        set -gx HOME /home/jiewang
        set CARGO "$HOME/.cargo/bin"

        # TODO

    case '*'
        # TODO
end

# Common settings

set -g fish_greeting
set -gx SHELL fish
set -gx EDITOR nvim
set -gx TERM alacritty
set -gx LANG en_US.UTF-8

set -gx ALL_PROXY socks5://127.0.0.1:1080
set -gx HTTP_PROXY socks5://127.0.0.1:1080
set -gx HTTPS_PROXY socks5://127.0.0.1:1080
set -gx NO_PROXY localhost,127.0.0.1,::1

alias proxy="naive ~/Downloads/naive/config.json"

if status is-interactive
    # eval (zellij setup --generate-auto-start fish | string collect)
end
