" .vimrc - Vim configuration file.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                 " be iMproved, required
filetype off                     " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'           " plugin manager

" Explorer & Alternate property
Plugin 'vim-scripts/taglist.vim'        " taglist browser
Plugin 'scrooloose/nerdtree'            " file explorer
Plugin 'yegappan/mru'                   " most recently used
Plugin 'vim-scripts/a.vim'              " Alternate between *.c and *.h

" Snippets & Code Complete
Plugin 'SirVer/ultisnips'               " snippets engine, witten in Python
"Plugin 'vim-scripts/snipMate'          " snippets engine, same as ultisnips, but written in VimL
Plugin 'honza/vim-snippets'             " snippets files for various programming languages
Plugin 'Shougo/deoplete.nvim'           " code complete: deoplete
Plugin 'roxma/nvim-yarp'                " needed by deoplete
Plugin 'roxma/vim-hug-neovim-rpc'       " needed by deoplete
Plugin 'deoplete-plugins/deoplete-go'   " golang code complete support, co-operate with deoplete
Plugin 'fatih/vim-go'                   " needed by gocode
Plugin 'stamblerre/gocode', {'rtp': 'vim/'}   " golang autocompletetion datemon
Plugin 'zchee/deoplete-clang'           " c code complete support, co-operate with deoplete

" Language Support
Plugin 'godlygeek/tabular'              " vim-markdown plugin needed this
Plugin 'plasticboy/vim-markdown'        " markdown syntax support

" Code Style
Plugin 'editorconfig/editorconfig-vim'  " define and maintain consistend coding style

" Others
Plugin 'scrooloose/nerdcommenter'       " comment tool
Plugin 'vim-scripts/DoxygenToolkit.vim' " another comment tool
Plugin 'vim-airline/vim-airline'        " status bar
Plugin 'vim-airline/vim-airline-themes' " status bar theme

call vundle#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set	nocompatible                 " out of VI compatible mode.
set	nobackup                     " do not create backup file
set	autoread                     " auto read file that has been changed on disk
set	autowrite                    " auto save before commands like :next and :make
set	backspace=indent,eol,start   " backspace can delete everything
set	history=50                   " number of recorded history command
set	helpheight=10                " minimal initial height of the help window
set	hidden                       " enable multiple modified buffers
set	mouse=a                      " allow using mouse in all mode
set	wildignore=.svn,.git,*.swp,*.bak,*.o,*.e,*~

filetype plugin indent on        " enable auto detect file type and automatically indent by filetype

" indent
set	autoindent                   " automatically indent new line same as previous line
set	smartindent                  " do smart autoindenting when starting a new line
set	cinoptions=:0                " set indent style in context
set	shiftwidth=4                 " number of spaces to indent each level
set	noexpandtab                  " no expand tabs into spaces
set	tabstop=4                    " number of spaces in a tab

" auto complete
set	completeopt=longest,menuone  " auto complete options (insert mode)
set	pumheight=10                 " maximum height of the popup menu

" display options
color	mycolor                  " custom color scheme
set	background=dark
syntax	on                       " syntax highlighting.
set	cursorline                   " highlight the screen line of the cursor
set	number                       " show line number
set	laststatus=2                 " always show the status line
set	ruler                        " line and column number of the cursor position
set	showcmd                      " show (partial) command in status line
set	scrolloff=5                  " minimal number of screen lines to keep beyond the cursor
set	list                         " show <tab>
set	listchars=tab:-\ ,trail:.    " <tab> show as '- ', <space> show as '.'

" wrap
set	textwidth=100                " do not wrap words (insert)
set	nowrap                       " do not wrap words (view)
"set	whichwrap=h,l            " allow specified keys that can move across line

" file encoding and format
set	encoding=utf-8
set	fileencoding=utf-8
set	fileencodings=utf-8,gb2312,gbk,gb18030
set	termencoding=utf-8
set	fileformat=unix

" fold
set	foldenable                   " enable folde the text content
set	foldmethod=marker            " the kind of folding

" search
set	hlsearch                     " highlight search match
set	ignorecase                   " do case insensitive matching
set	smartcase                    " do not ignore if search pattern has CAPS
set	incsearch                    " incremental search

" command completion
set	wildmenu                     " enhanced command completion
set	wildmode=list:longest,full   " command completion mode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcut Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set mapleader
let mapleader=","

" Space to command mode
nnoremap <space> :
vnoremap <space> :

" Switching between vim multi screens
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

" "cd" to change to open directory
let OpenDir=system("pwd")
nmap <silent> <leader>cd :exe 'cd ' . OpenDir<cr>:pwd<cr>

nmap  <F2> :TlistToggle<cr>
nmap  <F3> :NERDTreeToggle<cr>
nmap  <F4> :MRU<cr>
nmap  <F5> :call RunShell("Generate tags", "ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .")<cr>
nmap  <F6> :call RunShell("Generate tags", "ctags -R * .")<cr>

function! RunShell(Msg, Shell)
	echo a:Msg . '...'
	call system(a:Shell)
	echon 'done'
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" taglist.vim
let g:Tlist_Auto_Update=1
let g:Tlist_Process_File_Always=1
let g:Tlist_Exit_OnlyWindow=1
let g:Tlist_Show_One_File=1
let g:Tlist_WinWidth=25
let g:Tlist_Enable_Fold_Column=0
let g:Tlist_Auto_Highlight_Tag=1
" NERDTree.vim
let g:NERDTreeWinPos="right"
let g:NERDTreeWinSize=25
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeQuitOnOpen=1
" vim-airline (only for xterm)
set term=xterm-256color
let g:airline_theme='badwolf'
" deoplete.nvim
let g:deoplete#enable_at_startup = 1
" deoplete-clang
let g:deoplete#sources#clang#libclang_path = "/usr/lib/libclang.so"
let g:deoplete#sources#clang#clang_header = "/usr/lib/clang/7.0.1/include"
" DoxygenToolkit.vim
let g:DoxygenToolkit_briefTag_pre=""
let g:DoxygenToolkit_paramTag_pre="\\param   "
let g:DoxygenToolkit_returnTag   ="\\return  "
let g:DoxygenToolkit_authorName="kang.pan"
" vim-markdown
let g:vim_markdown_folding_disabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Restore the last quit position when open file.
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     exe "normal g'\"" |
    \ endif
