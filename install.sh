#!/usr/bin/env bash

# backup dotfiles
mkdir -p $HOME/.dotfiles_backup

# create symlinks 
for rcfile in $PWD/*/*; do
        filename=$(basename "$rcfile")
        mv -f $HOME/.$filename $HOME/.dotfiles_backup 2>/dev/null
        ln -sf $rcfile $HOME/.$filename
done

# clone zprezto 
rm -rf ~/.zprezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# pull all submodules (vim packages)
git submodule update --init --recursive
