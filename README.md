# dotfiles

## Platforms

- macOS + [iTerm2](https://www.iterm2.com) + [Karabiner-Elements](https://pqrs.org/osx/karabiner/)
- [DEPRECATED] Windows7 + [Cygwin](https://www.cygwin.com) + [AutoHotkey](http://www.autohotkey.com)
- [DEPRECATED] CentOS/Fedora

## Setup

```
$ git clone git@github.com:knmkr/dotfiles.git
$ cd dotfiles
$ git submodule update -i

$ DOTFILES_DIR=${PWD}

$ ln -s ${DOTFILES_DIR}/{.zsh,.zshenv,.emacs.d,.psqlrc,.tmux.conf} ${HOME}

$ ln -s ${DOTFILES_DIR}/VCS/git/.gitconfig ${HOME}
$ cp ${DOTFILES_DIR}/VCS/git/.gitconfig.local.example ${HOME}/.gitconfig.local

$ mkdir -p .config/karabiner/ && ln -s ${DOTFILES_DIR}/keybind/osx/karabiner.json ${HOME}/.config/karabiner/
```
