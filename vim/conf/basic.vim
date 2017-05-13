set nocompatible  " be iMproved
filetype on       " Do not FileType auto detection
filetype plugin on " Enable filetype-specific plugins
filetype indent on " Enable filetype-specific indenting

set viminfo='20,\"50

" <BS> allows to delete below objects
" indent   autoindent
" eol	     end-of-line (join lines)
" start	   the start position of insert
set backspace=indent,eol,start

" Enable clipboard
set clipboard=unnamed,autoselect

" Set help lang to japanese
set helplang=ja
" First, you can execute it only once
" helptags ~/.vim/bundle/vimdoc-ja/doc


" Indent
set expandtab     " replace a tab to multiple spaces
set tabstop=2     " width which tab uses
set shiftwidth=2  " width to move in auto indentation
set softtabstop=2 " width to move in tab and backspace
set autoindent    " continue indentation of previous line on breaking
set smartindent   " adjust indent of next line with end of previous line on breaking

" Show line number
set number

" Spell check
set spell
set spelllang=en,cjk

" Command completion
set wildmenu
set wildmode=longest:full,full
