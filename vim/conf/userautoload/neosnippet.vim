" NeoSnippet
let g:neosnippet#snippets_directory = '~/.vim/snippets'

" ファイル名で区別出来る場合は直接呼び出し
" ファイル名で区別できない場合は一旦関数に投げる
augroup NeoSnippet
  autocmd!
  autocmd BufEnter *_spec.rb call s:LoadSnippet('ruby.rails.rspec.snip')
  autocmd BufEnter *.rb      call s:LoadRailsSnippet()
augroup END

" rails用スニペット呼び出し関数
function! s:LoadRailsSnippet()

  " カレントディレクトリのディレクトリパス（絶対パス）取得
  let s:current_file_path = expand("%:p:h")

  " appフォルダ内でなければ無視
  if ( s:current_file_path !~ "app/" )
    return

  elseif ( s:current_file_path =~ "app/models" )
    call s:LoadSnippet('ruby.rails.model.snip')

  elseif ( s:current_file_path =~ "app/controllers" )
    call s:LoadSnippet('ruby.rails.controller.snip')

  elseif ( s:current_file_path =~ "app/views" )
    call s:LoadSnippet('ruby.rails.view.snip')

  elseif ( s:current_file_path =~ "coufig/routes.rb" )
    call s:LoadSnippet('ruby.rails.route.snip')
  endif
endfunction

function! s:LoadSnippet(filename)
  exec 'NeoSnippetSource' .
    \ globpath(g:neosnippet#snippets_directory, a:filename)
endfunction

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
