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
