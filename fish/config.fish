fish_vi_key_bindings

set -l os (uname)

switch (uname -s)
    case Darwin
        abbr --add --global z zellij

        fish_add_path /opt/homebrew/bin
        fish_add_path ~/Development/nvim-macos/bin
        fish_add_path ~/Development/flutter/bin
        fish_add_path ~/Downloads/naive
        fish_add_path ~/Library/pnpm
        fish_add_path ~/Library/PostgreSQL/14/bin

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

set -gx ALL_PROXY socks5://127.0.0.1:1080
set -gx HTTP_PROXY socks5://127.0.0.1:1080
set -gx HTTPS_PROXY socks5://127.0.0.1:1080
set -gx NO_PROXY localhost,127.0.0.1,::1

alias proxy="naive ~/Downloads/naive/config.json"

if status is-interactive
    # eval (zellij setup --generate-auto-start fish | string collect)
end
