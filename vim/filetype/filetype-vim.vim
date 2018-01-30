" ------- vimscript file settings ---------------------- {{{
"autocmd filetype vim setlocal foldmethod=marker
let maplocalleader = "\<space>"
nnoremap <buffer> <localleader>c I"<esc>
nnoremap <buffer> <localleader>uc ^x<esc>
vnoremap <buffer> <localleader>c <esc>`<<c-v>`>I"<esc>
" }}}
