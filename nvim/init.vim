" Plugins
" -----------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Completion
Plug 'airblade/vim-gitgutter' " Git annotation
Plug 'altercation/vim-colors-solarized' " Color scheme
Plug 'andrewradev/switch.vim' " Switch the word like 'true' and 'false'
Plug 'danro/rename.vim' " Rename file
Plug 'fntlnz/atags.vim' " Manage tag files
Plug 'haya14busa/incsearch.vim' " Incremental search
Plug 'haya14busa/vim-operator-flashy' " Highlight yanked area
Plug 'itchyny/lightline.vim' " Favarite status line
Plug 'jiangmiao/auto-pairs' " Auto pair
Plug 'junegunn/vim-emoji' " Integrate emojis to plugin (for internal)
Plug 'kana/vim-operator-user' " Define user operator (for internal)
Plug 'keith/swift.vim' " Swift
Plug 'mitsuse/autocomplete-swift' " Completion for Swift
Plug 'osyo-manga/vim-anzu' " Search status
Plug 'osyo-manga/vim-over' " Easy to replace text
Plug 'tpope/vim-commentary' " Switch line to code comment
Plug 'tpope/vim-fugitive' " Git wrapper
Plug 'uplus/deoplete-solargraph' " Completion for Ruby
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy finder
Plug 'junegunn/fzf.vim'
Plug 'Quramy/tsuquyomi' " For Typescript
Plug 'leafgarland/typescript-vim' " For Typescript
call plug#end()


" Basics
" -----------------------------------------------------------------------------

" viminfo:
" Save 20 files recently edited
" 50 lines is saved in each files
set viminfo='20,\"50

" Indent
set expandtab     " replace a tab to  spaces
set tabstop=2     " width which tab uses
set shiftwidth=2  " width to move in auto indentation
set softtabstop=2 " width to move in tab and 
set autoindent    " continue indentation of previous line on breaking
set smartindent   " adjust indent of next line with end of previous line on breaking

" Show line number
set number

" esc key works faster
set timeoutlen=1000 ttimeoutlen=0

" Color
let g:solarized_termcolors=16
let g:solarized_termtrans=1
syntax enable
set background=dark
colorscheme solarized

" Enable clipboard
set clipboard+=unnamedplus


" Enable python3
let g:python3_host_prog = substitute(system('which python3'),"\n","","")
" let g:loaded_python3_provider=1


" ctags
set tags=./tags,tags
" When has multiple options, Show all options
nnoremap <C-]> g<C-]>
map ] <C-]>
map [ <C-T>

" Tabs
map ]t gt
map [t gT


" lightline
" -----------------------------------------------------------------------------
set laststatus=2
let g:lightline = {
        \ 'colorscheme': 'solarized',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'fugitive': 'MyFugitive',
        \ }
        \ }
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set noshowmode

function! MyModified()
  if &ft =~ 'help\|vimfiler\|gundo' | return '' | endif

  if &modified
    return '+'
  else
    return &modifiable ? '' : '-'
  endif
endfunction

function! MyReadonly()
  if &ft =~ 'help\|vimfiler\|gundo' | return '' | endif

  return &readonly ? 'x' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction


" vim-over
" -----------------------------------------------------------------------------
nnoremap <silent> <Leader>r :OverCommandLine<CR>


" git-gitgutter
" -----------------------------------------------------------------------------
" Keymap
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

" Style
silent! if emoji#available()
  let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
  let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
  let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
  let g:gitgutter_sign_modified_removed = emoji#for('collision')
endif

" SEE: https://github.com/airblade/vim-gitgutter/issues/164
highlight clear SignColumn


" deocomplete
" -----------------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

autocmd CompleteDone * silent! pclose!


" autocomplete-swift
" -----------------------------------------------------------------------------
" Jump to the first placeholder by typing `<C-k>`.
autocmd FileType swift imap <buffer> <C-k> <Plug>(autocomplete_swift_jump_to_placeholder)



" atags
" -----------------------------------------------------------------------------
autocmd BufWritePost * call atags#generate()



" incserach
" -----------------------------------------------------------------------------
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
nmap  n <Plug>(incsearch-nohl)<Plug>(anzu-n-with-echo)
nmap  N <Plug>(incsearch-nohl)<Plug>(anzu-N-with-echo)

map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

augroup incsearch-keymap
  autocmd!
  autocmd VimEnter * call s:incsearch_keymap()
augroup END
function! s:incsearch_keymap()
  IncSearchNoreMap <Right> <Over>(incsearch-next)
  IncSearchNoreMap <Left>  <Over>(incsearch-prev)
  IncSearchNoreMap <Down>  <Over>(incsearch-scroll-f)
  IncSearchNoreMap <Up>    <Over>(incsearch-scroll-b)
endfunction



" swith
" -----------------------------------------------------------------------------
nnoremap - :Switch<cr>

let g:switch_custom_definitions =
    \ [
    \   ['on', 'off'],
    \   ['let', 'var']
    \ ]

" git rebase
autocmd FileType gitrebase call add(g:switch_custom_definitions,
    \ ['pick', 'reword', 'edit', 'squash', 'fixup', 'exec', 'drop'] )
autocmd FileType vim       call add(g:switch_custom_definitions,
    \ ['0', '1'] )



" operator-flashy
" -----------------------------------------------------------------------------
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)


" fzf
" -----------------------------------------------------------------------------
map <c-p> :Files<CR>
