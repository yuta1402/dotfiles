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

" Tab
nnoremap [tab] <Nop>
nmap t [tab]

for i in range(1, 9)
    execute 'nnoremap <silent> [tab]'.i ':<C-u>tabnext'.i.'<CR>'
endfor
