#!/usr/bin/env bash

echo "Symlinking dotfiles..."

declare -A dotfiles=( \
#       ["source"]="destination"
        [$(pwd)/zshrc]="$HOME/.zshrc" \
	    [$(pwd)/vimrc]="$HOME/.vimrc" \
	    # [$(pwd)/gvimrc]="$HOME/.gvimrc" \
        [$(pwd)/sshconfig]="$HOME/.ssh/config" \
        [$(pwd)/latexmkrc]="$HOME/.latexmkrc" \
        [$(pwd)/latexmkrc]="$HOME/.latexmkrc" \
        [$(pwd)/chunkwmrc]="$HOME/.chunkwmrc" \
        [$(pwd)/ideavimrc]="$HOME/.ideavimrc" \
        [$(pwd)/skhdrc]="$HOME/.skhdrc" \

        )

for sourcePath in "${!dotfiles[@]}"; do
        destPath=${dotfiles[$sourcePath]}
        ln -si $sourcePath $destPath;
done

echo "Symlinking done!"
