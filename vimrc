" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2017 Sep 20
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
if version >= 800
	source $VIMRUNTIME/defaults.vim
endif

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
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
if version >= 800 && has('syntax') && has('eval')
  packadd! matchit
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
set hlsearch

set wildmenu
set wildmode=full

"remap
noremap \ ,
cnoremap <c-p> <Up>
cnoremap <c-n> <Down>
" }}}

" ------- Mappings -------------------------- {{{
"back to normal mode
let mapleader = "\<space>"

inoremap jk <esc>
cnoremap jk <c-c>
noremap! <esc> <nop>

"edit and source my .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"Use alt+k or alt+j to move current line up or down. 
nnoremap k kddp-
noremap j ddp

"Change case of current word.
inoremap u <esc>guiwea
inoremap U <esc>gUiwea
nnoremap u guiwe
nnoremap U gUiwe

"wrap selected contents in quotes
vnoremap " <esc>`<i"<esc>ea"<esc>
vnoremap ' <esc>`<i'<esc>ea'<esc>

nnoremap H ^
nnoremap L $
" }}}

" ------- vimscript file settings ---------------------- {{{
augroup filetype_vim
	autocmd!
	autocmd filetype vim setlocal foldmethod=marker
	autocmd filetype vim let maplocalleader = "\<space>"
	autocmd filetype vim nnoremap <buffer> <localleader>c i"<esc>
	autocmd filetype vim nnoremap <buffer> <localleader>uc ^x<esc>
	autocmd filetype vim vnoremap <buffer> <localleader>c <esc>`<<c-v>`>i"<esc>
augroup end
" }}}

" ------- c/c++ file settings ---------------------- {{{
augroup filetype_c
	autocmd!
	autocmd FileType c let maplocalleader = "\<space>"
	autocmd FileType c nnoremap <buffer> <localleader>c I//<esc>
	autocmd FileType c nnoremap <buffer> <localleader>uc ^xx
	autocmd FileType c vnoremap <buffer> <localleader>c <esc>`<<c-v>`>I//<esc>
augroup END
" }}}
