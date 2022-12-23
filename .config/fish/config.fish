fish_vi_key_bindings
set -g fish_greeting
# add path (installed before fish)
set -gx PATH /home/jiew/.cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
set -gx EITOR nvim
set -gx LANG en_US.UTF-8

if status is-interactive
    # Commands to run in interactive sessions can go here
	# Environments

	abbr --add --global add "paru -S"
	abbr --add --global remove "paru -R"
	abbr --add --global clean "paru -c"
	abbr --add --global upgrade "paru -Syu" # upgrade
    abbr --add --global updates "paru -Qu" # check available updates
	abbr --add --global naive "cd && cd naive && ./naive"
end

# for zoxide
# zoxide init fish | source
