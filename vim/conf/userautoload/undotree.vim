let g:undotree_WindowLayout = 2
let g:undotree_SetFocusWhenToggle = 1

nnoremap U :UndotreeToggle<cr>

function! g:Undotree_CustomMap()
  nmap <buffer> J <plug>UndotreeGoNextState
  nmap <buffer> K <plug>UndotreeGoPreviousState
endfunc
