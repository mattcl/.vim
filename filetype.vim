if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufNewFile,BufRead *.snippets setf snippets
    au! BufNewFile,BufRead *.tml setf htmldjango
    au! BufNewFile,BufRead access.log* setf apache_log
augroup END
