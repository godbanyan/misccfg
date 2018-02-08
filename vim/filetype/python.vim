setlocal runtimepath+=.

let maplocalleader = "\<space>"

nnoremap <silent> <buffer> <F5> :call <SID>RunScript()<cr>
nnoremap <buffer> <c-]> g<c-]>
nnoremap <buffer> <localleader>c I# <esc>
nnoremap <buffer> <localleader>uc ^xx
vnoremap <buffer> <localleader>c <esc>`<<c-v>`>I# <esc>
vnoremap <buffer> <localleader>uc <esc>`<<c-v>`>^lx

" Run current script file
function! s:RunScript()
	write
	call s:AddCurrentPath()
	py3file %
endfunction

" Add current path to sys.path
function! s:AddCurrentPath()
let g:py_curpath = expand("%:p:h")
py3 << EOF
import sys
import vim
if vim.vars["py_curpath"].decode('UTF8') not in sys.path:
	sys.path.append(vim.vars["py_curpath"].decode('UTF-8'))
del vim
EOF
unlet g:py_curpath
endfunction
