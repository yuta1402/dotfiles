" Initialize

let s:is_windows = has('win32') || has('win64')

function! IsWindows() abort
    return s:is_windows
endfunction

if IsWindows()
    set shellslash
endif

" Disable menu
if has('gui_running')
    set guioptions=Mc
endif
