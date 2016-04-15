"Filetype file

if exists("did_load_filetypes")
    finish
endif

augroup filetypedetect
    " TypeScript
    autocmd BufNewFile,BufRead *.ts set filetype=typescript

    " Markdown
    autocmd! BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown

    " TOML
    autocmd BufNewFile,BufRead *.toml set filetype=toml
augroup END
