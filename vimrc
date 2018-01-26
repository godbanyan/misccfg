" Get the defaults that most users want if exists.
if filereadable($VIMRUNTIME . "/defaults.vim")
  source $VIMRUNTIME/defaults.vim
endif

" Save undo history in ~/.vim/.undo.
if has('persistent_undo')

  " If the directory don't exist create it first.
  if !isdirectory($HOME . "/.vim/.undo")
    call mkdir($HOME . "/.vim/.undo", "p")
  endif

  set undodir=$HOME/.vim/.undo
  set undofile	

endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('packages') && has('syntax') && has('eval')
	
	set packpath+=~/.vim
	packadd! matchit

endif

" when using 'vim' alt-prefixing key should be remapped
if v:progname ==? "vim"
	
	"Use alt+k or alt+j to move current line up or down. 
	nnoremap j ddp
	nnoremap k kddpk

	"Change case of current word.
	inoremap u <esc>guiwea
	inoremap U <esc>gUiwea
	nnoremap u guiwe
	nnoremap U gUiwe

endif

" ------- Basic Settings ------------- {{{
set laststatus=2			"always show statusline
set showcmd					"show commands while you are typing
set number					"show line number
set tabstop=4				"set length of tab
set cindent
set shiftround
set shiftwidth=4
set ignorecase

"search
set incsearch

set wildmenu
set wildmode=full

" }}}

" ------- Mappings -------------------------- {{{
"back to normal mode
let mapleader = "\<space>"

"handle windows
nnoremap <c-w>m <c-w>_<c-w>\|

"remap
cnoremap <c-p> <Up>
cnoremap <c-n> <Down>

"switch on highlighting
nnoremap <leader>N :set hlsearch<cr>
"switch off highlighting
nnoremap <leader>n :set nohlsearch<cr>

inoremap jk <esc>l
cnoremap jk <c-c>
noremap! <esc> <nop>

"edit and source my .vimrc 
nnoremap <leader>ev :split $MYVIMRC<cr><c-w>_
nnoremap <leader>sv :source $MYVIMRC<cr>

"wrap selected contents in quotes
vnoremap " <esc>`>a"<esc>`<i"<esc>
vnoremap ' <esc>`>a'<esc>`<i'<esc>

nnoremap H ^
nnoremap L $
" }}}

" ------- vimscript file settings ---------------------- {{{
augroup filetype_vim
	autocmd!
	"autocmd filetype vim setlocal foldmethod=marker
	autocmd filetype vim let maplocalleader = "\<space>"
	autocmd filetype vim nnoremap <buffer> <localleader>c I"<esc>
	autocmd filetype vim nnoremap <buffer> <localleader>uc ^x<esc>
	autocmd filetype vim vnoremap <buffer> <localleader>c <esc>`<<c-v>`>I"<esc>
augroup end
" }}}

" ------- c/c++ file settings ---------------------- {{{
augroup filetype_c
	autocmd!
	packadd! nerdtree
	packadd! tagbar

	autocmd FileType c,cpp let maplocalleader = "\<space>"
	autocmd FileType c,cpp nnoremap <buffer> <c-]> g<c-]>
	autocmd FileType c,cpp nnoremap <buffer> <localleader>c I//<esc>
	autocmd FileType c,cpp nnoremap <buffer> <localleader>uc ^xx
	autocmd FileType c,cpp vnoremap <buffer> <localleader>c <esc>`<<c-v>`>I//<esc>
	autocmd FileType c,cpp vnoremap <buffer> <localleader>uc <esc>`<<c-v>`>^lx
	autocmd FileType c,cpp nnoremap <buffer> ' :TagbarOpen jf<cr>
	autocmd FileType c,cpp nnoremap <buffer> <c-n> :NERDTreeFocus<cr>

	autocmd vimenter * NERDTree | TagbarOpen 
	autocmd vimenter * wincmd l
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

augroup END
" }}}
