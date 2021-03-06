if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufNewFile,BufRead *.snippets setf snippets
    au! BufNewFile,BufRead *.tml setf htmldjango
    au! BufNewFile,BufRead access.log* setf apache_log
    au! BufNewFile,BufRead Gemfile setf ruby
    au! BufNewFile,BufRead Guardfile setf ruby
    au! BufNewFile,BufRead *.ru setf ruby
    au! BufNewFile,BufRead *.tt setf eruby
    au! BufNewFile,BufRead *.zsh-theme setf zsh
    au! BufNewFile,BufRead *.md setf markdown
augroup END
