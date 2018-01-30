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

cp -rf $curpath/vim ~/.vim

if tmux -V 1>/dev/null 2>&1 ;then
	ln -sf $curpath/tmux.conf ~/.tmux.conf
fi
