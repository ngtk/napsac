" switch-vim
nnoremap - :Switch<cr>

let g:switch_custom_definitions =
    \ [
    \   ['on', 'off']
    \ ]

" git rebase
autocmd FileType gitrebase call add(g:switch_custom_definitions,
    \ ['pick', 'reword', 'edit', 'squash', 'fixup', 'exec', 'drop'] )
autocmd FileType vim       call add(g:switch_custom_definitions,
    \ ['0', '1'] )

