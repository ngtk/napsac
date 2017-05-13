" vim-tags
let g:vim_tags_project_tags_command = "{CTAGS} -R --language=ruby {OPTIONS} ./app 2>/dev/null"
let g:vim_tags_gems_tags_command = "{CTAGS} -R --language=ruby {OPTIONS} `bundle show --paths` 2>/dev/null"
let g:vim_tags_use_vim_dispatch = 1
let g:vim_tags_use_language_field = 0
let g:vim_tags_auto_generate = 0
set tags+=tags,Gemfile.lock.tags
" key-mapping
map ] <C-]>
map [ <C-T>
