#!/bin/bash

# Binaries that will be installed
bins=(
    "nano"
    "zsh"
    "curl"
    "git"
    "ripgrep"
    "fzf"
    "azure-cli"
    "gh"
    "awscli"
    "jq"
    "fzf"
    "ripgrep"
)

casks=(
    "brave-browser"
    "firefox"
    "google-chrome"
    "adobe-acrobat-reader"
    "postman"
    "dbngin"
    "visual-studio-code"
    "slack"
)

for binary in "${bins[@]}"
do
    # check if the binary is already present, otherwise install
    if brew list --formula | grep "$binary" 1>/dev/null
        then echo "$binary already installed"
        else brew install "$binary"
    fi
done

for cask in "${casks[@]}"
do
    # check is cask is present or not, if not install
    if brew list --cask | grep "$cask" 1>/dev/null
        then echo "$cask is already installed"
        else brew casks install "$c"
    fi
done

