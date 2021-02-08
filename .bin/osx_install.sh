#!/bin/bash

# Setting up brew
xcode-select --install

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" 

brew tap homebrew/bundle
brew tap caskroom/cask
brew install mas

brew update
brew bundle


