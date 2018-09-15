" Mapping settings

" Easily edit .vimrc
nnoremap <silent> <Leader>ev :<C-u>edit $VIMROOT<CR>

" Clear highlight
nnoremap <silent> <ESC><ESC> :nohlsearch<CR>:match<CR>

if has('nvim')
    tnoremap <silent> <ESC><ESC> <C-\><C-n>
endif

noremap j gj
noremap k gk
noremap gj j
noremap gk k
