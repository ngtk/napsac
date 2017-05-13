autocmd BufNewFile,BufRead *.md call s:open_markoff(expand("%"))

function! s:open_markoff(filename) abort
  if input('Would you like to open markoff? (y/n)') == 'y'
    silent execute "!open " . a:filename " -a markoff"
    echo "\nmarkoff opened!"
  endif
endfunction
