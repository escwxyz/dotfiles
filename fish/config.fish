fish_vi_key_bindings

set -l os (uname)

switch (uname -s)
    case Darwin
        abbr --add --global z zellij

        set -gx HOME /Users/jiewang
        set SQLITE /opt/homebrew/opt/sqlite/bin
        set SOLANA "$HOME/solana/bin"
        set HOMEBREW /opt/homebrew/bin
        set SYSTEM "/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/sbin:/Library/Apple/usr/bin:/usr/local/go/bin"
        set WEZTERM "/Applications/WezTerm.app/Contents/MacOS"
        set NEOVIDE "/Applications/Neovide.app/Contents/MacOS"
        set NPM "$PNPM/nodejs/18.12.1/bin"
        set POSTGRESQL /Library/PostgreSQL/14/bin/
        set ZIG "$HOME/Downloads/zig"
        set NEXTEST "$HOME/Development/cargo-nextest"
        set FLUTTER "$HOME/Development/flutter/bin"
        set NEOVIM "$HOME/Development/nvim-macos/bin"
        set -gx PATH "$NEXTEST:$NEOVIM:$FLUTTER:$ZIG:$POSTGRESQL:$NPM:$HOMEBREW:$CARGO:$SOLANA:$PNPM:$SQLITE:$WEZTERM:$NEOVIDE:$SYSTEM"

        set -gx LDFLAGS -L/opt/homebrew/opt/sqlite/lib
        set -gx CPPFLAGS -I/opt/homebrew/opt/sqlite/include
        set -gx PKG_CONFIG_PATH /opt/homebrew/opt/sqlite/lib/pkgconfig

        set -gx PUB_HOSTED_URL "https://pub.flutter-io.cn"
        set -gx FLUTTER_STORAGE_BASE_URL "https://storage.flutter-io.cn"

        set -gx PNPM_HOME /Users/jiewang/Library/pnpm
        if not string match -q -- $PNPM_HOME $PATH
            set -gx PATH "$PNPM_HOME" $PATH
        end

        # NOTE test neovim config
        # set -gx NVIM_APPNAME "neovim"

    case Linux

        set -gx HOME /home/jiewang
        # TODO

    case '*'
        # TODO
end

# Common settings

set -g fish_greeting
set -gx SHELL fish
set -gx EDITOR nvim
set -gx LANG en_US.UTF-8

abbr --add --global proxy "set -gx HTTP_PROXY socks5://127.0.0.1:1080 && set -gx HTTPS_PROXY socks5://127.0.0.1:1080 && cd && cd Downloads/naive && ./naive"
abbr --add --global unproxy "set -e HTTP_PROXY && set -e HTTPS_PROXY"
set CARGO "$HOME/.cargo/bin"



if status is-interactive
    # eval (zellij setup --generate-auto-start fish | string collect)
end

# bass source ~/.local/share/nvim/lazy/vmux/plugin/setup_vmux.sh nvim

# abbr --add --global ls "xplr"
# abbr --add --global dotfiles "git --git-dir $HOME/.dotfiles --work-tree $HOME"
# abbr --add --global dotfiles-gitui "gitui -d $HOME/.dotfiles -w $HOME"
