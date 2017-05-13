let g:template_basedir = '~/.vim/template'
let g:template_files = '**'

" rspec template
" ------------------------------
" require [spec|rails]_helper
"
" describe <class name> do
" end
" ------------------------------
autocmd User plugin-template-loaded call s:template_keywords()
function! s:template_keywords()
  %s/<+CLASS NAME+>/\=s:class_name()/g
  %s/<+HELPER NAME+>/\=s:helper_name()/g
endfunction

function! s:class_name() abort
  let filepath = expand("%:p:r") " /path/to/project/spec/hoge/fuga_spec
  let address = s:extract_class_address(filepath) " hoge/fuga
  let address = s:filter_rails_prefix(address) " hoge/fuga
  let class_name = s:ruby_camerize(address) " Hoge::Fuga
  return class_name
endfunction

function! s:helper_name() abort
  if exists('g:loaded_rails') && RailsDetect() == 1
    return 'rails_helper'
  else
    return 'spec_helper'
  endif
endfunction

" text: controllers/foo/apples_controller
" return: foo/apples_controller
function! s:filter_rails_prefix(text) abort
  if !exists('g:loaded_rails') || RailsDetect() == 0
    return a:text
  endif

  let prefix_list = [
        \ 'controllers',
        \ 'models',
        \ 'views',
        \ 'lib',
        \ 'features',
        \ 'helpers',
        \ 'jobs',
        \ 'requests'
        \ ]
  let pattern = join(prefix_list, '\|')
  let filtered = substitute(a:text, pattern, '', '') " /foo/apples_controller
  let filtered = filtered[1:-1] " foo/apples_controller
  return filtered
endfunction

" text: 'foo_bar/hoo_spec'
" return: 'FooBar::Hoo'
function! s:ruby_camerize(text) abort
  let inherit_list = split(a:text, '/')
  let camerized_list = []
  for name in inherit_list
    call add(camerized_list, s:camelize_text(name))
  endfor
  return join(camerized_list, '::')
endfunction


" filename: '/path/to/project/spec/foo/bar_spec'
" return: 'foo/bar_spec'
function! s:extract_class_address(filename) abort
  return matchstr(a:filename, 'spec\(/\w*\)*_spec')[5:-6]
endfunction


" atom: 'foo'
" return: 'Foo'
function! s:camelize_atom(atom) abort
  return toupper(a:atom[0]) . a:atom[1:-1]
endfunction


" text: 'foo_bar'
" return: 'FooBar'
function! s:camelize_text(text) abort
  let atoms = split(a:text, '_')
  let camelized_atoms = []
  for atom in atoms
    call add(camelized_atoms, s:camelize_atom(atom))
  endfor
  return join(camelized_atoms, '')
endfunction
