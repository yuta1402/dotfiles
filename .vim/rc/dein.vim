" dein settings

let g:dein#auto_recache = 1

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" Load dein
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . substitute(fnamemodify(s:dein_repo_dir, ':p'), '/$', '', '')
endif

if !dein#load_state(s:dein_dir)
    finish
endif

call dein#begin(s:dein_dir)

let s:toml_path      = '~/.vim/rc/dein.toml'
let s:toml_lazy_path = '~/.vim/rc/dein_lazy.toml'

call dein#load_toml(s:toml_path,      {'lazy': 0})
call dein#load_toml(s:toml_lazy_path, {'lazy': 1})

call dein#end()
call dein#save_state()

" Installation check
if dein#check_install()
    call dein#install()
endif
