fish_vi_key_bindings

# switch (uname -s)
#     case Darwin
#
#
#     case Linux
#
#         # set -gx HOME /home/jiewang
#         # set CARGO "$HOME/.cargo/bin"
#         # TODO
#
#     case '*'
#         echo "Unspported platform!"
#         # TODO
# end

# Common settings

set -g fish_greeting
set -gx SHELL fish
set -gx EDITOR nvim
# set -gx TERM wezterm
set -gx LANG en_US.UTF-8

# storing secrets
if test -f ~/.config/fish/secrets.fish
    source ~/.config/fish/secrets.fish
end

fish_add_path ~/Development/flutter/bin
fish_add_path /opt/homebrew/bin
fish_add_path ~/Library/PostgreSQL/14/bin
fish_add_path ~/Development/nvim-macos-arm64/bin
fish_add_path ~/.bun/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/Downloads/naive
fish_add_path /usr/local/opt/libressl/bin
fish_add_path ~/.deno/bin/deno

set -gx ALL_PROXY socks5://127.0.0.1:1080
set -gx HTTP_PROXY socks5://127.0.0.1:1080
set -gx HTTPS_PROXY socks5://127.0.0.1:1080
set -gx NO_PROXY localhost,127.0.0.1,::1

# have to use this shit, proxy setting doesnt work with flutter
set -gx PUB_HOSTED_URL "https://pub.flutter-io.cn"
set -gx FLUTTER_STORAGE_BASE_URL "https://storage.flutter-io.cn"

alias proxy="naive ~/Downloads/naive/config.json"
alias unproxy="set -e ALL_PROXY && set -e HTTP_PROXY && set -e HTTPS_PROXY && set -e NO_PROXY"

# pnpm
set -gx PNPM_HOME /Users/jiewang/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
#
## zoxide
zoxide init --cmd cd fish | source
