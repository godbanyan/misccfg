" ------- c/c++ file settings ---------------------- {{{
let maplocalleader = "\<space>"
nnoremap <buffer> <c-]> g<c-]>
nnoremap <buffer> <localleader>c I//<esc>
nnoremap <buffer> <localleader>uc ^xx
vnoremap <buffer> <localleader>c <esc>`<<c-v>`>I//<esc>
vnoremap <buffer> <localleader>uc <esc>`<<c-v>`>^lx
nnoremap <buffer> ' :TagbarOpen jf<cr>
nnoremap <buffer> <c-n> :NERDTreeFocus<cr>
" }}}
