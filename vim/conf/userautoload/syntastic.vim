" syntastic.vim
let g:syntastic_enable_signs  = 1
let g:syntastic_check_on_wq   = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_mode_map = {
      \ 'mode': 'passive'
      \ }
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_javascript_checkers = ['eslint']

" styles
hi SyntasticErrorSign   ctermbg=black ctermfg=1
hi SyntasticWarningSign ctermbg=black ctermfg=3
