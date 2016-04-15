" Mapping settings

let mapleader = "\<Space>"

" Easily edit .vimrc
nnoremap <silent> <Leader>ev :<C-u>edit $MYVIMRC<CR>
vnoremap <silent> <Leader>rv :<C-u>source $MYVIMRC<CR>

" Clear highlight
nnoremap <ESC><ESC> :nohlsearch<CR>:match<CR>

noremap j gj
noremap k gk
noremap gj j
noremap gk k
