if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufNewFile,BufRead *.snippets setf snippets
    au! BufNewFile,BufRead *.tml setf php
augroup END
