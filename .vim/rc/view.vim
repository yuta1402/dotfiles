" View settings

" シンタックスカラーリングを設定する
syntax enable
" デフォルトの配色をdarkに設定する
set background=dark
" カラースキーマの設定をluciusにする
colorscheme lucius
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

" Disable beeping
set visualbell t_vb=
set noerrorbells

if !has('gui_running')
    set t_Co=256
endif
