" vim-rspec
let &g:errorformat = '%E%.%#%n)\ %.%#,\#%f:%l%.%#,%C%m,%-G%.%#'
let g:rspec_command = 'silent Dispatch AUTODOC=1 bundle exec rspec {spec} --color --format documentation'

" key mappings
nnoremap <Leader>c :call RunCurrentSpecFile()<CR>
nnoremap <Leader>n :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>
nnoremap <Leader>a :call RunAllSpecs()<CR>

