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

`rcup` - install, update dotfiles.
`rcdn` - opposite of `rcup`.
`mkrc <dotfile/dotdir>` - make rc file/dir.
`lsrc` - list rc files/dirs.


Install composer
=====

```
brew install composer
```

Install macvim for YouCompleteMe
=====

```
brew unlink vim
brew install macvim
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
