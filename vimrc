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

"	packadd! nerdtree
"	packadd! tagbar
"
"	autocmd vimenter * NERDTree | TagbarOpen
"	autocmd vimenter * wincmd l
"	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

endif

" when using 'vim' alt-prefixing key should be remapped
if v:progname ==? "vim"
	
	"Use alt+k or alt+j to move current line up or down. 
	nnoremap <silent> j :.m .+1<cr>
	nnoremap <silent> k :.m .-2<cr>

	vnoremap <silent> j :m '>+1<cr>gv
	vnoremap <silent> k :m '<-2<cr>gv

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

"statusline 
" Show EOL type and last modified timestamp, right after the filename
" Set the statusline
set statusline=%f               " filename relative to current $PWD
set statusline+=%h              " help file flag
set statusline+=%m              " modified flag
set statusline+=%r              " readonly flag
set statusline+=\ [%{&ff}]      " Fileformat [unix]/[dos] etc...
set statusline+=\ (%{strftime(\"%H:%M\ %d/%m/%Y\",getftime(expand(\"%:p\")))})  " last modified timestamp
set statusline+=%=              " Rest: right align
set statusline+=%l,%c%V         " Position in buffer: linenumber, column, virtual column
set statusline+=\ %P            " Position in buffer: Percentage
set statusline+=\ -\ %L			" Number of lines in buffer
" }}}

" ------- Mappings -------------------------- {{{
"back to normal mode
let mapleader = "\<space>"

"handle windows
nnoremap <c-w>m <c-w>_<c-w>\|

"remap
cnoremap <c-p> <Up>
cnoremap <c-n> <Down>

"toggle highlighting.
nnoremap <silent> <leader>n :set hlsearch!<cr>

inoremap jk <esc>l
cnoremap jk <c-c>

"edit and source my .vimrc 
nnoremap <silent> <leader>ev :split $MYVIMRC<cr><c-w>_
nnoremap <silent> <leader>sv :source $MYVIMRC<cr> :echo "vimrc updated!"<cr>

"edit and source filetype specific file 
nnoremap <silent> <leader>ef :let @@='$HOME/.vim/filetype/' . &filetype . '.vim'<cr>:split <c-r>"<cr>
nnoremap <silent> <leader>sf :let @@='$HOME/.vim/filetype/' . &filetype . '.vim'<cr>:source <c-r>"<cr>

"wrap selected contents in quotes
vnoremap " <esc>`>a"<esc>`<i"<esc>
vnoremap ' <esc>`>a'<esc>`<i'<esc>

nnoremap H ^
nnoremap L $
" }}}

autocmd filetype vim so $HOME/.vim/filetype/vim.vim
autocmd filetype c,cpp,cuda so $HOME/.vim/filetype/c.vim
autocmd filetype python so $HOME/.vim/filetype/python.vim
