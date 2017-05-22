#!/bin/bash

# Install homebrew.
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install brew cask.
brew tap caskroom/cask

# Update brew, brew cask.
brew update
brew cask update

# Install git.
brew install git

# Install zsh, zsh completions.
brew install zsh zsh-completions

# Install Oh My Zsh.
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# Change shell to zsh.
chsh -s /usr/local/bin/zsh

# Install expect.
brew install expect

# Install rcm.
brew tap thoughtbot/formulae
brew install rcm
