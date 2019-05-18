dotfiles
===

I use [rcm](https://github.com/thoughtbot/rcm) to manage my dotfiles.

Homebrew
=====

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Cask:

```
brew install cask
```

RCM
=====

To install:

```
brew tap thoughtbot/formulae
brew install rcm
```

Commands:

```
rcup
rcdn
mkrc
lsrc
```

Composer
=====

```
brew install composer
```

Drush, drupal console, php_codesniffer, coder:

```
composer global require drush/drush
composer global require drupal/console
composer global require squizlabs/php_codesniffer
composer global require drupal/coder
```

Or, simply (as composer.json is part of this dotfiles):

```
cd ~/.composer
composer install
```

YouCompleteMe
=====

Macvim is required for YouCompleteMe, not vim shipped with OSX or MacOS, neither brew's vim.

```
brew unlink vim
brew install cmake
brew install macvim
```

Complete installation with Vundle (see below).

Compile YouCompleteMe with semantic support for C-family languages through libclang:

```
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
```

Vundle
=====

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Install plugins inside vim:

```
:PluginInstall
```

Or, from command line:

```
vim +PluginInstall +qall
```

Tmux
=====

```
brew install tmux
brew install tmux-mem-cpu-load
```

Tmux plugin manager:

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Install other tmux plugins, launch tmux and:

```
prefix + I
```

where `I` is capital `i` as in `I`nstall.



Install miscs.
=====

```
brew install coreutils
brew install gawk
brew install cowsay
brew install figlet
brew install toilet
brew install git
brew install hub
brew install wget
brew install speedtest-cli
brew install youtube-dl
```

Music
=====

```
brew install mpd
brew install ncmpcpp
```

Shell
=====

```
brew install zsh
```

FZF
=====

```
brew install fzf
```
