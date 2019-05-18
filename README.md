dotfiles
===

I use [rcm](https://github.com/thoughtbot/rcm) to manage my dotfiles.

Install composer
=====

```
brew tap homebrew/dupes
brew tap homebrew/php
brew install php70
brew install mcrypt php70-mcrypt
brew install composer
```

To .zshrc file:

```
export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
```

To debug:

```
brew info php70
```

If unseemingly unrelated errors are returned:

```
brew upgrade zsh
```

