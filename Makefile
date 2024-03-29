.PHONY: *

debian:
	sudo apt update \
	&& sudo apt upgrade -y \
	&& sudo apt install git git-lfs build-essential stow \
	python3-distutils python3-venv -y \
	&& sudo apt autoremove -y && sudo apt clean -y \
	&& git lfs install

arch:
	sudo pacman -S \
	# utility
	base-devel stow unzip task kdeconnect ripgrep fd \
	# secure shell
	openssh \
	# encryption
	gnupg \
	# shell
	zsh \
	# windows manager
	i3 \
	# launcher
	dmenu \
	# X server
	xorg xorg-xinit xclip dunst \
	# fonts
	noto-fonts noto-fonts-cjk ttf-ibmplex-mono-nerd \
	# browser
	firefox firefox-tridactyl \
	# input method
	ibus-rime rime-double-pinyin rime-emoji \
	# driver
	pulseaudio iwd dhcpcd \
	# editor
	neovim \
	# programming
	python clang jdk-openjdk maven nodejs npm \
	# terminal
	alacritty tmux \
	# password manager
	pass \
	# proxy
	v2ray clash \
	# library
	python-sortedcontainers \
	# language server protocol
	pyright lua-language-server autopep8 prettier

cli:
	stow -t ~ -v -S git/ ssh/ pip/ npm/ task/ nvim/ tmux/ zsh/ maven/

gui:
	stow -t ~ -v -S i3/ x/ alacritty/ ibus/ tridactyl/ code/
	sudo stow -t /etc/X11/xorg.conf.d/ -v -S x11/

monitor:
	xrandr --output eDP-1 --off --output DP-1 --auto

code:
	code --install-extension DavidAnson.vscode-markdownlint
	code --install-extension Lencerf.beancount
	code --install-extension ms-pyright.pyright
	code --install-extension vscodevim.vim
