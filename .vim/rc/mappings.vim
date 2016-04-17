" Mapping settings

" Easily edit .vimrc
nnoremap <silent> <Leader>ev :<C-u>edit $MYVIMRC<CR>
vnoremap <silent> <Leader>rv :<C-u>source $MYVIMRC<CR>

" Clear highlight
nnoremap <silent> <ESC><ESC> :nohlsearch<CR>:match<CR>

noremap j gj
noremap k gk
noremap gj j
noremap gk k
