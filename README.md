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

Complete installation with Vundle.

Compile YouCompleteMe with semantic support for C-family languages through libclang:

```
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
```



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

Tmux
=====

```
brew install tmux
brew install tmux-mem-cpu-load
```

YouCompleteMe

```
brew install cmake
```

FZF
=====

```
brew install fzf
```
