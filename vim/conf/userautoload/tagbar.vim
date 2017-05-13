" executable
let g:tagbar_ctags_bin = "/usr/local/bin/ctags"

" automaticaly close window
let g:tagbar_autoclose = 1

" key mapping
nmap t :TagbarToggle<CR>

" Ruby
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }
