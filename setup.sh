#!/bin/bash

# Set up dependencies

BREW_PACKAGES='git bash-completion coreutils tmux'
VIM_PACKAGE='vim --env-std --override-system-vim'

brew prune
brew install $BREW_PACKAGES $VIM_PACKAGE

# Install dotfiles

git submodule update --init

BASE=$(greadlink -e $(dirname $0))

for fname in $BASE/userdots/.*; do
    ln -sf `greadlink -e $fname` $HOME/
done
