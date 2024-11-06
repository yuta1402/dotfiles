" hook_source {{{
call ddu#custom#patch_global({
    \   'ui': 'filer',
    \   'sources': [{'name': 'file', 'params': {}}],
    \   'sourceOptions': {
    \     'file': {
    \       'sorters': ['sorter_alpha'],
    \       'columns': ['filename'],
    \     },
    \   },
    \   'kindOptions': {
    \     'file': {
    \       'defaultAction': 'open',
    \     },
    \   },
    \   'uiOptions': {
    \     'filer': {
    \       'toggle': v:true
    \     },
    \   },
    \   'uiParams': {
    \     'filer': {
    \       'winWidth': 35,
    \       'sort': 'filename',
    \       'split': 'vertical',
    \       'splitDirection': 'topleft',
    \     }
    \   },
    \   'actionOptions': #{
    \     narrow: #{
    \       quit: v:false,
    \     },
    \     open: #{
    \       quit: v:false,
    \     },
    \   },
    \ })
" }}}
