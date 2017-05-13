nnoremap <silent><buffer>gs :Unite giti/status -horizontal<CR>
nnoremap <silent><buffer>gl :Unite giti/log -horizontal<CR>
nnoremap <silent><buffer>gs :Unite giti/status -horizontal<CR>
nnoremap <silent><buffer>gh :Unite giti/branch_all<CR>

augroup UniteCMD
  autocmd!
  autocmd FileType unite call <SID>unite_settings()
augroup END

function! s:unite_settings() abort
  for source in unite#get_current_unite().sources
    let source_name = substitute(source.name, '[-/]', '_', 'g')
    if !empty(source_name) && has_key(s:unite_hooks, source_name)
      call s:unite_hooks[source_name]()
    endif
  endfor
endfunction

let s:unite_hooks = {}
function! s:unite_hooks.giti_status() abort
  nnoremap <silent><buffer><expr>gam unite#do_action('ammend')
  nnoremap <silent><buffer><expr>gcm unite#do_action('commit')
  nnoremap <silent><buffer><expr>ga unite#do_action('stage')
  nnoremap <silent><buffer><expr>gc unite#do_action('checkout')
  nnoremap <silent><buffer><expr>gd unite#do_action('diff')
  nnoremap <silent><buffer><expr>gu unite#do_action('unstage')
endfunction

function! s:unite_hooks.giti_branch() abort
  nnoremap <silent><buffer><expr>d unite#do_action('delete')
  nnoremap <silent><buffer><expr>D unite#do_action('delete_force')
  nnoremap <silent><buffer><expr>rd unite#do_action('delete_remote')
  nnoremap <silent><buffer><expr>rD unite#do_action('delete_remote_force')
endfunction
