#!/bin/bash
curpath=$(cd `dirname $0`; pwd)
gitcfg=~/.gitconfig
vrc=~/.vimrc
gvrc=~/.gvimrc
sh_ali=~/.bash_aliases

# when installed in windows
if [ -n $WINDIR ]; then
	ln -sf $curpath/gvimrc $gvrc
fi

ln -sf $curpath/gitconfig $gitcfg

ln -sf $curpath/vimrc $vrc

ln -sf $curpath/bash_aliases $sh_ali

if [ -d ~/.spf13-vim-3 ]; then
    source spf13cfg/install.sh
    ln -sf ~/.spf13-vim-3/.vimrc $vrc
fi

if tmux -V 1>/dev/null 2>&1 ;then
	ln -sf $curpath/tmux.conf ~/.tmux.conf
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
