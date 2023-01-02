fish_vi_key_bindings
set -g fish_greeting
# add path (installed before fish)
set -gx PATH /home/jiew/alacritty/target/release/alacritty:/home/jiew/flutter/bin:/home/jiew/.cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
set -gx EITOR nvim
set -gx LANG en_US.UTF-8
# flutter mirrors
set -gx FLUTTER_STORAGE_BASE_URL https://storage.flutter-io.cn 
set -gx PUB_HOSTED_URL https://pub.flutter-io.cn

if status is-interactive
    # Commands to run in interactive sessions can go here
	# Environments

	abbr --add --global add "paru -S"
	abbr --add --global remove "paru -R"
	abbr --add --global clean "paru -c"
	abbr --add --global upgrade "paru -Syu" # upgrade
	abbr --add --global updates "paru -Qu" # check available updates
	abbr --add --global naive "cd && cd naive && ./naive"
	abbr --add --global ls "nnn -de"
end

# for zoxide
# zoxide init fish | source

# pnpm
set -gx PNPM_HOME "/home/jiew/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end
