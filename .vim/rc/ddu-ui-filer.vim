" hook_add {{{
nnoremap <silent> <Leader>f <Cmd>Ddu
    \ -name=filer-`tabpagenr()` -ui=filer -resume
    \ -source-option-file-columns=filename
    \ <CR>
" }}}

" hook_source {{{
" autocmd myautocmd tabenter,winenter,cursorhold,focusgained *
"     \ call ddu#ui#do_action('checkitems')
" }}}

" ddu-filer {{{
nnoremap <buffer><silent> <Space>
    \ <Cmd>call ddu#ui#do_action('toggleSelectItem')<CR>
nnoremap <buffer> *
    \ <Cmd>call ddu#ui#do_action('toggleAllItems')<CR>
nnoremap <buffer> c
    \ <Cmd>call ddu#ui#multi_actions([
    \   ['itemAction', #{ name: 'copy' }],
    \   ['clearSelectAllItems'],
    \ ])<CR>
nnoremap <buffer> d
    \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'delete' })<CR>
nnoremap <buffer> m
    \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'move' })<CR>
nnoremap <buffer> r
    \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'rename' })<CR>
nnoremap <buffer> x
    \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'executeSystem' })<CR>
nnoremap <buffer> h
    \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'narrow', params: #{ path: '..' } })<CR>
nnoremap <buffer><expr> <CR>
    \ ddu#ui#get_item()->get('isTree', v:false) ?
    \ "<Cmd>call ddu#ui#do_action('itemAction', #{ name: 'narrow' })<CR>" :
    \ tabpagewinnr(tabpagenr(), '$') <= 1 ?
    \ "<Cmd>call ddu#ui#multi_actions([
    \   ['itemAction', #{ name: 'open', params: #{ command: 'new' } }],
    \   ['quit'],
    \ ])<CR>" :
    \ "<Cmd>call ddu#ui#do_action('itemAction', #{ name: 'open', params: #{ command: 'wincmd p <Bar> edit' } })<CR>"
nnoremap <buffer><expr> l
    \ ddu#ui#get_item()->get('isTree', v:false) ?
    \ "<Cmd>call ddu#ui#multi_actions([
    \   ['expandItem', #{ mode: 'toggle'}],
    \   ['cursorNext'],
    \ ])<CR>" :
    \ tabpagewinnr(tabpagenr(), '$') <= 1 ?
    \ "<Cmd>call ddu#ui#multi_actions([
    \   ['itemAction', #{ name: 'open', params: #{ command: 'new' } }],
    \   ['quit'],
    \ ])<CR>" :
    \ "<Cmd>call ddu#ui#do_action('itemAction', #{ name: 'open', params: #{ command: 'wincmd p <Bar> edit' } })<CR>"
nnoremap <buffer><expr> o
    \ ddu#ui#get_item()->get('isTree', v:false) ?
    \ "<Cmd>call ddu#ui#multi_actions([
    \   ['expandItem', #{ mode: 'toggle'}],
    \   ['cursorNext'],
    \ ])<CR>" :
    \ tabpagewinnr(tabpagenr(), '$') <= 1 ?
    \ "<Cmd>call ddu#ui#multi_actions([
    \   ['itemAction', #{ name: 'open', params: #{ command: 'new' } }],
    \   ['quit'],
    \ ])<CR>" :
    \ "<Cmd>call ddu#ui#do_action('itemAction', #{ name: 'open', params: #{ command: 'wincmd p <Bar> edit' } })<CR>"
nnoremap <buffer> O
    \ <Cmd>call ddu#ui#do_action('itemAction', #{
    \   name: 'open',
    \   params: #{ command: 'tabedit' },
    \ })<CR>
nnoremap <buffer><expr> s
    \ tabpagewinnr(tabpagenr(), '$') <= 1 ?
    \ "<Cmd>call ddu#ui#multi_actions([
    \   ['itemAction', #{ name: 'open', params: #{ command: 'new' } }],
    \   ['quit'],
    \ ])<CR>" :
    \ "<Cmd>call ddu#ui#do_action('itemAction', #{ name: 'open', params: #{ command: 'wincmd p <Bar> split' } })<CR>"
nnoremap <buffer><expr> v
    \ tabpagewinnr(tabpagenr(), '$') <= 1 ?
    \ "<Cmd>call ddu#ui#multi_actions([
    \   ['itemAction', #{ name: 'open', params: #{ command: 'new' } }],
    \   ['quit'],
    \ ])<CR>" :
    \ "<Cmd>call ddu#ui#do_action('itemAction', #{ name: 'open', params: #{ command: 'wincmd p <Bar> vsplit' } })<CR>"
nnoremap <buffer> p
    \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'paste'})<CR>
nnoremap <buffer><silent> q
    \ <Cmd>call ddu#ui#do_action('quit')<CR>
nnoremap <buffer> K
    \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'newDirectory' })<CR>
nnoremap <buffer> N
    \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'newFile' })<CR>
nnoremap <buffer> .
    \ <Cmd>call ddu#ui#multi_actions([
    \   [
    \     'updateOptions', #{
    \       sourceOptions: #{
    \         file: #{
    \           matchers: ToggleHidden('file'),
    \         },
    \       },
    \     },
    \   ],
    \   [
    \      'redraw', #{ method: 'refreshItems' },
    \   ],
    \ ])<CR>

function! ToggleHidden(name)
  return ddu#custom#get_current(b:ddu_ui_name)
        \ ->get('sourceOptions', {})
        \ ->get(a:name, {})
        \ ->get('matchers', [])
        \ ->empty() ? ['matcher_hidden'] : []
endfunction
" }}}
