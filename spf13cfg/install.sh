vlp=~/.vimrc.local
vbundlelp=~/.vimrc.bundles.local
vbeforelp=~/.vimrc.before.local

curpath=$HOME/misccfg/spf13cfg

ln -sf $curpath/.vimrc.local $vlp

ln -sf $curpath/.vimrc.bundles.local $vbundlelp

ln -sf $curpath/.vimrc.before.local $vbeforelp
