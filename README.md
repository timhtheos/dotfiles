dotfiles
===

I use [rcm](https://github.com/thoughtbot/rcm) to manage my dotfiles.

Generate new SSH key pair
=====

```
ssh-keygen -t rsa -b 4096 -C "me@timothyae.com"
```

Homebrew
=====

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Cask:

```
brew install cask
```

Install miscellaneous stuffs
=====

```
brew install coreutils
brew install gawk
brew install cowsay
brew install figlet
brew install toilet
brew cask install xquartz
brew install git
brew install hub
brew install wget
brew install speedtest-cli
brew install youtube-dl
```

Install dotfiles
=====

```
cd ~
git clone git@github.com:timhtheos/dotfiles.git
ln -s dotfiles .dotfiles
```

Rcm
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

Vim
=====

MacOS is shipped with `git`. Do not use git shipped with MacOS, neither brew's vim.
Use MacVim. It is required for YouCompleteMe (YCM).

```
brew unlink vim
brew install macvim
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

YouCompleteMe (YCM)
=====

Compile YouCompleteMe with semantic support for C-family languages through libclang:

```
brew install cmake
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
```

Tmux
=====

```
brew install tmux
brew install tmux-mem-cpu-load
```

Tmate:

```
brew install tmate
```

Tmux plugin manager:

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Reattach to user namespace:

```
brew install reattach-to-user-namespace
```

Install other tmux plugins, launch tmux and:

```
prefix + I
```

where `I` is capital `i` as in `I`nstall.

Z shell
=====

```
brew install zsh
brew install zsh-completions
```

Additional steps are needed for zsh-completions. To check these steps, execute `brew info zsh-completions`.

Oh My Zsh:

(Optional)
```
rm -rf ~/.oh-my-zsh
```

```
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.zshrc ~/.zshrc.orig
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s /bin/zsh
```

Exit from terminal and log back. Check with `echo $SHELL` for your current shell.
If it does not return ZSH, re-execute the last command above, with `sudo`:

```
sudo chsh -s /bin/zsh
```

Re-init RCM:

```
rcdn
rcup
```

Music
=====

```
brew install mpd
brew install ncmpcpp
brew install mpc
```

Fzf
=====

```
brew install fzf
```

Mutt
=====

```
brew install mutt
```

Vagrant
=====

```
brew cask install vagrant
brew cask install virtualbox
```

Erorr `Command: ["hostonlyif", "create"]`

```
sudo "/Library/Application Support/VirtualBox/LaunchDaemons/VirtualBoxStartup.sh" restart

```

Docker
=====

```
brew install docker
brew install docker-compose
brew cask install docker
```

Apps
=====

```
brew cask install google-chrome
brew cask install firefox
brew cask install deluge
brew cask install slate
brew cask install bitbar
brew cask install skype
brew cask install steam
brew cask install caprine
brew cask install iterm2
brew cask install vlc
```

Asciiquarium
=====

```
brew install asciiquarium
```

Remind
=====

(Deprecated)

```
brew install remind
brew install wyrd
```

