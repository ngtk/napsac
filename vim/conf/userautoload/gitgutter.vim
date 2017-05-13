" git-gitgutter

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
