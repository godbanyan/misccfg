"Use alt+k or alt+j to move current line up or down. 
nnoremap <m-j> ddp
nnoremap <m-k> kddpk

"Change case of current word.
inoremap <m-u> <esc>guiwea
inoremap <m-U> <esc>gUiwea
nnoremap <m-u> guiwe
nnoremap <m-U> gUiwe

set winaltkeys=no
autocmd GUIEnter * simalt ~x
colorscheme evening
set gfn=Consolas:h14
