" Basic settings
"
" Encoding settings
" 文字コードをUTF-8に設定する
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,euc-jp,cp932
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

" Input settings
" ヤンクでクリップボードにコピーする
" set clipboard+=unnamed
set clipboard+=unnamedplus
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" <Tab>キーでSpaceのインデントを挿入する
set expandtab
" 行頭での<Tab>の幅
set shiftwidth=4
" 行頭以外での<Tab>の幅
set tabstop=4
" キーボードで<TAB>を入力した際、<TAB>を何文字の空白に変換するか
set softtabstop=4
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" set backspace
set backspace=indent,eol,start

augroup QfAutoCommands
  autocmd!
  " Auto-close quickfix window
  autocmd WinEnter * if (winnr('$') == 1) && (getbufvar(winbufnr(0), '&buftype')) == 'quickfix' | quit | endif
augroup END

if executable('fcitx-remote')
    " for fcitx
    function! Fcitx2en()
        let s:input_status = system('fcitx-remote')
        if s:input_status == 2
            let l:a = system('fcitx-remote -c')
        endif
    endfunction
    autocmd InsertLeave * call Fcitx2en()
endif
