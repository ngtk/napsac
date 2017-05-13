" let g:startify_custom_header =
"    \ map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']

let g:startify_custom_header = readfile(expand('~/.vim/start.txt'))
