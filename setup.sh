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

echo "setting up global gitignore"
git config --global core.excludesFile "$PWD/gitignore"
git config --global core.pager "diff-so-fancy | less --tabs=4 -RF"
git config --global interactive.diffFilter "diff-so-fancy --patch"
