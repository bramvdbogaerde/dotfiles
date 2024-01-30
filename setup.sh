#!/bin/bash

# link DEST SOURCE
function link() {
	if [[ -e "$1" ]]; then 
		echo "$1 already exists skipping..."
	else 
		echo "Destination config for $1 does not exist, installing..."
		ln -s $2 $1
	fi
}

link $HOME/.config/nvim $PWD/nvim
link $HOME/.config/fish $PWD/fish
link $HOME/.xmonad $PWD/xmonad
link $HOME/.config/helix $PWD/helix
link $HOME/.config/hypr $PWD/hypr
link $HOME/.config/waybar $PWD/waybar

echo "setting up global gitignore"
git config --global core.excludesFile "$PWD/gitignore"
