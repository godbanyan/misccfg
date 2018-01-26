"copy word to '+' register
nnoremap <m-w> "+yiw

"edit and source my .gvimrc
nnoremap <leader>eg :split $MYGVIMRC<cr><c-w>_
nnoremap <leader>sg :source $MYGVIMRC<cr>

"Use alt+k or alt+j to move current line up or down. 
nnoremap <m-j> ddp
nnoremap <m-k> kddpk

"Change case of current word.
inoremap <m-u> <esc>guiwea
inoremap <m-U> <esc>gUiwea
nnoremap <m-u> guiwe
nnoremap <m-U> gUiwe

set winaltkeys=no
autocmd GUIEnter * set gfn=Consolas:h14
autocmd GUIEnter * colorscheme evening
autocmd GUIEnter * simalt ~x
