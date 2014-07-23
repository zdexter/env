#!/bin/bash

# Set up dependencies

BREW_PACKAGES='coreutils'

brew install $BREW_PACKAGES

# Install dotfiles

BASE=$(greadlink -e $(dirname $0))

git submodule update --init

for fname in $BASE/userdots/.*; do
    ln -sf `greadlink -e $fname` $HOME/
done
