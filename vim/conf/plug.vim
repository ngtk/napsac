call plug#begin('~/.vim/plugged')

" A
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'andrewradev/switch.vim'
" B
Plug 'basyura/unite-rails'
Plug 'bronson/vim-trailing-whitespace'
" C
Plug 'chase/vim-ansible-yaml', { 'for': ['yaml'] }
" D
Plug 'danro/rename.vim'
Plug 'derekwyatt/vim-scala', { 'for': ['scala'] }
" E
" G
Plug 'garbas/vim-snipmate'
Plug 'gorodinskiy/vim-coloresque', { 'for': ['css', 'scss'] }
Plug 'guns/xterm-color-table.vim', { 'on': 'XtermColorTable' }
" H
Plug 'haya14busa/vim-operator-flashy'
Plug 'haya14busa/incsearch.vim'
" I
Plug 'itchyny/dictionary.vim'
Plug 'itchyny/lightline.vim'
" J
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/vim-emoji'
" K
Plug 'kana/vim-operator-user'
Plug 'kchmck/vim-coffee-script'
Plug 'kien/ctrlp.vim'
Plug 'kmnk/vim-unite-giti'
" L
Plug 'lambdalisue/vim-gista'
Plug 'lambdalisue/vim-gista-unite'
" M
Plug 'majutsushi/tagbar'
Plug 'marcweber/vim-addon-mw-utils'
Plug 'mattn/benchvimrc-vim'
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'eruby', 'javascript.jsx'] }
Plug 'mattn/webapi-vim'
Plug 'mbbill/undotree'
Plug 'mopp/autodirmake.vim'
Plug 'mxw/vim-jsx', { 'for': ['javascript.jsx'] }
" N
Plug 'nathanaelkane/vim-indent-guides', { 'for': ['python'], 'on': ['IndentGuidesEnable', 'IndentGuidesToggle']  }
Plug 'ngmy/vim-rubocop'
" O
Plug 'open-browser.vim'
Plug 'osyo-manga/vim-anzu'
Plug 'osyo-manga/vim-over'
" P
Plug 'pangloss/vim-javascript'
Plug 'powerman/vim-plugin-AnsiEsc'
" R
Plug 'rizzatti/dash.vim'
Plug 'rhysd/neco-ruby-keyword-args', { 'for': ['ruby', 'eruby'] }
Plug 'rhysd/unite-ruby-require.vim', { 'for': ['ruby', 'eruby'] }
Plug 'rking/ag.vim'
" S
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'shougo/neocomplete.vim'
Plug 'shougo/neosnippet'
Plug 'ngtk/neosnippet-snippets'
Plug 'shougo/unite.vim'
Plug 'shougo/vimproc.vim', { 'do': 'vim +VimProcInstall' }
Plug 'sorah/unite-ghq'
Plug 'szw/vim-tags'
Plug 'szw/vim-g'
" T
Plug 'thinca/vim-ref'
Plug 'thinca/vim-prettyprint'
Plug 'thinca/vim-template'
Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }
Plug 'othree/yajs.vim'
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
Plug 'tomasr/molokai'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-commentary'
Plug 'ngtk/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-unimpaired'
Plug 'tyru/open-browser-github.vim'
Plug 'tyru/open-browser.vim'
" V
Plug 'vim-jp/vimdoc-ja'
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'eruby'] }
Plug 'vim-scripts/sudo.vim'

call plug#end()
