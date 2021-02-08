#!/usr/bin/env zsh

cat .dotfiles/.vscode/.txt | xargs -n 1 code --install-extension

rm ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/.vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

rm ~/Library/Application\ Support/Code/User/keybindings.json
ln -s ~/.vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json