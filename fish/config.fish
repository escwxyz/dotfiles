fish_vi_key_bindings

set -l os (uname)

switch (uname -s)
	case Darwin
		abbr --add --global proxy "set -gx HTTP_PROXY socks5://127.0.0.1:1080 && set -gx HTTPS_PROXY socks5://127.0.0.1:1080 && cd && cd Downloads/naive && ./naive"
		abbr --add --global unproxy "set -e HTTP_PROXY && set -e HTTPS_PROXY"

		set -gx HOME "/Users/jiewang"
		set SQLITE "/opt/homebrew/opt/sqlite/bin"
		set PNPM "$HOME/Library/pnpm"
		set SOLANA "$HOME/solana/bin"
		set CARGO "$HOME/.cargo/bin"
		set HOMEBREW "/opt/homebrew/bin"
		set SYSTEM "/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/sbin:/Library/Apple/usr/bin:/usr/local/go/bin"
		set WEZTERM "/Applications/WezTerm.app/Contents/MacOS"
		set NEOVIDE "/Applications/Neovide.app/Contents/MacOS"
		set NPM "$PNPM/nodejs/18.12.1/bin"
		set POSTGRESQL "/Library/PostgreSQL/14/bin/"
		set -gx PATH "$POSTGRESQL:$NPM:$HOMEBREW:$CARGO:$SOLANA:$PNPM:$SQLITE:$WEZTERM:$NEOVIDE:$SYSTEM"

		set -gx LDFLAGS "-L/opt/homebrew/opt/sqlite/lib"
		set -gx CPPFLAGS "-I/opt/homebrew/opt/sqlite/include"
		set -gx PKG_CONFIG_PATH "/opt/homebrew/opt/sqlite/lib/pkgconfig"

	case Linux

		abbr --add --global add "paru -S"
		abbr --add --global remove "paru -R"
		abbr --add --global clean "paru -c"
		abbr --add --global upgrade "paru -Syu"
		abbr --add --global updates "paru -Qu"
		abbr --add --global naive "cd && cd naive && ./naive"

		set -gx HOME "/home/jiew"
		# TODO

	case '*'
		# TODO
end 

# Common settings

set -g fish_greeting
set -gx SHELL fish
set -gx EDITOR nvim
set -gx LANG en_US.UTF-8

bass source ~/.local/share/nvim/lazy/vmux/plugin/setup_vmux.sh nvim

# abbr --add --global ls "xplr"
# abbr --add --global dotfiles "git --git-dir $HOME/.dotfiles --work-tree $HOME"
# abbr --add --global dotfiles-gitui "gitui -d $HOME/.dotfiles -w $HOME"
