#!/bin/bash
curpath=$(pwd)
gitcfg=~/.gitconfig
vrc=~/.vimrc

if [ -e ~/.gitconfig ] || [ -L ~/.gitconfig ]; then
    rm $gitcfg
fi
ln -s $curpath/gitconfig ~/.gitconfig

if [ -e ~/.vimrc ] || [ -L ~/.vimrc ]; then
    rm ~/.vimrc
fi
ln -s $curpath/vimrc ~/.vimrc
