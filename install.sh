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

if [ -e ~/.bash_aliases ] || [ -L ~/.bash_aliases ]; then
    rm ~/.bash_aliases
fi
ln -s $curpath/bash_aliases ~/.bash_aliases

if [ -e ~/git-completion.bash ] || [ -L ~/git-completion.bash ]; then
    rm ~/git-completion.bash
fi
ln -s $curpath/git-completion.bash ~/git-completion.bash

if grep "git-completion.bash" $HOME/.bashrc >/dev/null
then
    :
else
    echo ". ~/git-completion.bash" >> $HOME/.bashrc
fi
