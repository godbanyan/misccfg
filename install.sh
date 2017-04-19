#!/bin/bash
curpath=~/misccfg
gitcfg=~/.gitconfig
vrc=~/.vimrc
sh_ali=~/.bash_aliases

ln -sf $curpath/gitconfig $gitcfg

ln -sf $curpath/vimrc $vrc

ln -sf $curpath/bash_aliases $sh_ali

if [ -d ~/.spf13-vim-3 ]; then
    source spf13cfg/install.sh
    ln -sf ~/.spf13-vim-3/.vimrc $vrc
fi

##### for git
#if [ -e ~/git-completion.bash ] || [ -L ~/git-completion.bash ]; then
#    rm ~/git-completion.bash
#fi
#ln -s $curpath/git-completion.bash ~/git-completion.bash
#
#if grep "git-completion.bash" $HOME/.bashrc >/dev/null
#then
#    :
#else
#    echo ". ~/git-completion.bash" >> $HOME/.bashrc
#fi
