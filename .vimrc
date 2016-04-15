if &compatible
    set nocompatible
endif

" dein settings
" Load dein
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . substitute(fnamemodify(s:dein_repo_dir, ':p'), '/$', '', '')
endif

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    let s:toml_path      = '~/.vim/rc/dein.toml'
    let s:toml_lazy_path = '~/.vim/rc/dein_lazy.toml'

    call dein#load_toml(s:toml_path,      {'lazy': 0})
    call dein#load_toml(s:toml_lazy_path, {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif


filetype plugin indent on

" Installation check
if has('vim_starting') && dein#check_install()
    call dein#install()
endif


" TypeScript settings
augroup TypeScriptSettings
    autocmd!
    autocmd BufNewFile,BufRead *.ts set filetype=typescript
augroup END


" lightline.vim settings
" let g:lightline = {
"     \ 'colorscheme': 'solarized',
"     \ }


" neocomplete settings
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_ignore_case = 1

" if !exists('g:neocomplete#sources#omni#input_patterns')
"     let g:neocomplete#sources#omni#input_patterns = {}
" endif


" Markdown settings
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

let g:previm_enable_realtime = 0

if has('mac')
    let g:previm_open_cmd = 'open -a Firefox'
endif


" Snippet settings
" Set neosnippet options
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

" clang settings
" Set clang options for vim-clang
let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '-std=c++1z -stdlib=libc++ --pedantic-errors'
let g:clang_check_syntax_auto = 1

let g:clang_c_completeopt = 'longest,menuone'
let g:clang_cpp_completeopt = 'longest,menuone'


" quickrun settings
" Set quickrun options
let g:quickrun_config = {
\    "_" : {
\        'runner' : 'vimproc',
\        'runner/vimproc/updatetime' : 60,
\        'outputter/buffer/split' : ':botright 8sp',
\        'outputter/buffer/close_on_empty' : 1,
\    },
\}

let g:quickrun_config['tex'] = {
\    'hook/cd/directory' : '%S:p:h',
\    'command' : 'latexmk',
\    'srcfile' : 'main.tex',
\    'cmdopt' : '-pv',
\}

let g:quickrun_config['cpp'] = {
\    'command' : 'g++',
\    'cmdopt' : '-std=c++11',
\}


" Encoding settings
" 文字コードをUTF-8に設定する
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8


" File settings
" ファイル変更中でも他のファイルを開けるようにする
set hidden
" ファイル内容が変更されると自動読み込みする
set autoread


" Backup settings
" undofileを作成しない
set noundofile
" swapfileを作らない
set noswapfile
" backupfileを作らない
set nobackup


" Search settings
" インクリメンタルサーチを行う
set incsearch
" 検索結果をハイライトする
set hlsearch
" 検索時に文字の大小を区別しない
set ignorecase
" 検索時に大文字を含んでいたら大小を区別する
set smartcase
" 検索をファイルの先頭へループする
set wrapscan


" Display settings
" シンタックスカラーリングを設定する
syntax on
" カラースキーマの設定をdesertにする
colorscheme desert
" デフォルトの配色をdarkに設定する
set background=dark
" 編集中のファイル名を表示する
set title
" 行番号を表示する
set number
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" CursorLineの描画
set cursorline
" 入力中のコマンドを表示する
set showcmd
" 閉じ括弧の入力時に対応する括弧を表示する
set showmatch
" showmatchの表示時間
set matchtime=3
" ステータスラインを常に表示する
set laststatus=2
" 不可視文字を表示する
set list
" 不可視文字を設定する
set listchars=tab:>\ ,trail:_


" Input settings
" ヤンクでクリップボードにコピーする
set clipboard=unnamed
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" 行頭での<Tab>の幅
set shiftwidth=4
" 行頭以外での<Tab>の幅
set tabstop=4
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]


" Mapping settings
let mapleader = "\<Space>"

noremap <C-j> <esc>
noremap! <C-j> <esc>
noremap j gj
noremap k gk

noremap <Leader>j :<C-u>TernDef<CR>
