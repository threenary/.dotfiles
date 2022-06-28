# Setting up brew
xcode-select --install

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" 

# Prearing the bundle
brew tap homebrew/bundle
tap homebrew/cask
brew install mas

# Release the Brewfile
brew update
brew bundle

# Fzf autocompletion https://github.com/junegunn/fzf#using-homebrew-or-linuxbrew
$(brew --prefix)/opt/fzf/install

# Install pending dependencies
./os_init.sh

# Source
source ~/.zshrc

