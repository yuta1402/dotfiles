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

    " Confluence Wiki
    autocmd BufNewFile,BufRead *.confluencewiki set filetype=confluencewiki

    " Re:VIEW
    autocmd BufNewFile,BufRead *.re set filetype=review
augroup END
