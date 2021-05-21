" Initialize

let s:is_windows = has('win32') || has('win64')

function! IsWindows() abort
    return s:is_windows
endfunction

if IsWindows()
    set shellslash
endif

" Use ',' instead of '\'
" Use <Leader> in global plugin
let g:mapleader = ','
" let g:mapleader = '\<Space>'

if has('gui_running')
    set guioptions=c
endif

let $VIMROOT = expand('~/.vim')

" for python
let g:python3_host_prog = $HOME . '/.venv/nvim-python3/bin/python'
