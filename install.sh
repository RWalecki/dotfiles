#!/usr/bin/env bash
mkdir -p $HOME/.dotfiles_backup

for rcfile in $PWD/*/*; do
        filename=$(basename "$rcfile")
        mv -f $HOME/.$filename $HOME/.dotfiles_backup 2>/dev/null
        ln -sf $rcfile $HOME/.$filename
done

rm -rf ~/.zprezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
