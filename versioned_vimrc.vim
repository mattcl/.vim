
" --------- general settings ----------
syntax on
set t_Co=256
colorscheme xoria256
set cursorline

" remove trailing whitespace on write
autocmd BufWritePre * :%s/\s\+$//e

" toggle line numbers with 2x ctrl-n
nmap <C-N><C-N> :set invnumber<CR>

" toggle nerdtree
map <F2> :NERDTreeToggle \| :silent NERDTreeMirror<CR>

" tab stuff
set showtabline=2
command T tabnew
command TE tabe <q-args>

" spaces instead of tabs, etc
set shiftwidth=4
set tabstop=4
set expandtab
set autoindent

" highlight searches
set hlsearch

" move to match while typing
set incsearch

set ignorecase
set smartcase

set backspace=indent,eol,start

set wildmenu
set showcmd

set cmdheight=2

set mouse=a

" misc Key Mappings
map Y y$

" C stuf
set cindent

" change filename
command! -nargs=1 AddExt execute "saveas ".expand("%:p").<q-args>
command! -nargs=1 ChgExt execute "saveas ".expand("%:p:r").<q-args>

" ctags stuff
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" show svn log for current file
command! SL silent call s:RunShellCommand("svn log ".expand("%:p"))

" show svn diff to previous revision
command! SDP silent call s:RunShellCommand("svn diff -x -w -r BASE:PREV ".expand("%:p")) | set filetype=diff

" better shell command
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
    echo a:cmdline
    let expanded_cmdline = a:cmdline
    for part in split(a:cmdline, ' ')
        if part[0] =~ '\v[%#<]'
            let expanded_part = fnameescape(expand(part))
            let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
        endif
    endfor
    botright new
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
    "call setline(1, 'You entered:    ' . a:cmdline)
    "call setline(2, 'Expanded Form:  ' .expanded_cmdline)
    "call setline(3,substitute(getline(2),'.','=','g'))
    execute '$read !'. expanded_cmdline
    1
endfunction
