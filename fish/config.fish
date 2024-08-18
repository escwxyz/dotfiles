fish_vi_key_bindings

switch (uname -s)
    case Darwin
        fish_add_path /opt/homebrew/bin
        fish_add_path ~/Library/PostgreSQL/14/bin
        fish_add_path ~/Development/nvim-macos/bin
        fish_add_path ~/.bun/bin

        # set -gx PUB_HOSTED_URL "https://pub.flutter-io.cn"
        # set -gx FLUTTER_STORAGE_BASE_URL "https://storage.flutter-io.cn"

    case Linux

        # set -gx HOME /home/jiewang
        # set CARGO "$HOME/.cargo/bin"
        # TODO

    case '*'
        echo "Unspported platform!"
        # TODO
end

# Common settings

set -g fish_greeting
set -gx SHELL fish
set -gx EDITOR nvim
set -gx TERM alacritty
set -gx LANG en_US.UTF-8

fish_add_path ~/Development/flutter/bin

fish_add_path ~/Downloads/naive

set -gx ALL_PROXY socks5://127.0.0.1:1080
set -gx HTTP_PROXY socks5://127.0.0.1:1080
set -gx HTTPS_PROXY socks5://127.0.0.1:1080
set -gx NO_PROXY localhost,127.0.0.1,::1

alias proxy="naive ~/Downloads/naive/config.json"

# zoxide
# zoxide init --cmd cd fish | source

if status is-interactive
    # eval (zellij setup --generate-auto-start fish | string collect)
end

# pnpm
set -gx PNPM_HOME /Users/jiewang/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
