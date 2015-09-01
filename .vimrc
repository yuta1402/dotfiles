" NeoBundle Settings
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-surround'

call neobundle#end()

NeoBundleCheck

filetype plugin indent on


" Encode
" 文字コードをUTF-8に設定する
set encoding=UTF-8
set fileencoding=UTF-8
set termencoding=UTF-8


" File
" ファイル変更中でも他のファイルを開けるようにする
set hidden
" ファイル内容が変更されると自動読み込みする
set autoread


" Backup
" undofileを作成しない
set noundofile
" swapfileを作らない
set noswapfile
" backupfileを作らない
set nobackup


" Search
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


" Display
" カラースキーマの設定をdesertにする
colorscheme desert
" デフォルトの配色をdarkに設定する
set background=dark
" シンタックスカラーリングを設定する
syntax on
" 編集中のファイル名を表示する
set title
" 行番号を表示する
set number
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
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


" Input
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
