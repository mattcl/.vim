set number
syntax off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Bundle 'bling/vim-airline'
Bundle 'dhruvasagar/vim-table-mode'
Bundle 'dougireton/vim-chef'
Bundle 'godlygeek/tabular'
Bundle 'goldfeld/vim-seek'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'junegunn/seoul256.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'mattn/emmet-vim'
Bundle 'mileszs/ack.vim'
Bundle 'myusuf3/numbers.vim'
Bundle 'noprompt/vim-yardoc'
Bundle 'rodjek/vim-puppet'
Bundle 'scrooloose/syntastic'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'SirVer/ultisnips'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'Valloric/YouCompleteMe'
Bundle 'vim-ruby/vim-ruby'

syntax on
filetype on
filetype plugin indent on
set t_Co=256

let g:seoul256_background = 233

" colorscheme seoul256
colorscheme xoria256
set cursorline
set colorcolumn=80
set spell spelllang=en_us
set spellcapcheck=

set ttimeoutlen=50

let g:airline_powerline_fonts = 1

" set leader to ','
let mapleader=','

" set indendation for special filetypes
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype eruby setlocal ts=2 sts=2 sw=2
autocmd Filetype cucumber setlocal ts=2 sts=2 sw=2
autocmd Filetype coffee setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
autocmd Filetype php set omnifunc=phpcomplete#CompletePHP


" fix ultisnips completions
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_collect_identifiers_from_tags_files = 1

" prevent preview window
set completeopt=menu

" fix phpcomplete completions
let g:phpcomplete_complete_for_unknown_classes = 0

" remove trailing whitespace on write
autocmd BufWritePre * :%s/\s\+$//e

" toggle nerdtree
map <F2> :NERDTreeToggle \| :silent NERDTreeMirror<CR>

nnoremap <F3> :NumbersToggle<CR>

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_arg_map = 1
let g:ctrlp_max_height = 20
let g:ctrlp_root_markers = ['.ctrlp']
" the directory at work is ridiculously huge
let g:ctrlp_max_files = 40000

let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]((Ext|Exe)|(\.(git|hg|svn)))$',
    \ 'file': '\v\.(pdf|ibb|vcxproj|list|dae|pyc|pyo|scons|ppt|xaf|bat|cfl|as|exe|so|dll|vert|frag|swf|png|jpg|gif|otf|wotf|eot|svg|ttf|pem|patch|pickle|psd|xpi|xrf|xsf|xsl|zip|tga|swp|swo)$'
    \ }

" tab pane stuff
set showtabline=2
command T tabnew
command TE tabe <q-args>

" split navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" reselect after indent or outdent
vnoremap < <gv
vnoremap > >gv

" spaces instead of tabs, etc
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent

" split lines
nnoremap K i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" searching stuff
set ignorecase
set smartcase

" highlight searches
set hlsearch

" move to match while typing
set incsearch

" center searches
nnoremap n nzz
nnoremap N Nzz

" increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" show invisible characters
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
nnoremap <leader>i :set list!<cr>

" mappings for Tabular.vim
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>at :Tabularize /\|<CR>
vmap <Leader>at :Tabularize /\|<CR>
nmap <Leader>aa :Tabularize /=><CR>
vmap <Leader>aa :Tabularize /=><CR>
" Don't put two spaces between : and the value
nmap <Leader>a: :Tabularize /:\zs/l1c0<CR>
vmap <Leader>a: :Tabularize /:\zs/l1c0<CR>

nmap <Leader>a, :Tabularize /,\zs/l1c0<CR>
vmap <Leader>a, :Tabularize /,\zs/l1c0<CR>

" Easy motion
let g:EasyMotion_leader_key = '<leader>'

" Emmet
let g:user_emmet_leader_key = '<leader>'
let g:user_emmet_mode='iv'

" misc
set backspace=indent,eol,start

set wildmenu
set showcmd

set cmdheight=2
set laststatus=2

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

" :SL -> show svn log for current file
command! SL silent call s:RunShellCommand("svn log ".expand("%:p"))

" :SD -> show svn diff to current revision
command! SDC silent call s:RunShellCommand("svn diff -x -w ".expand("%:p")) | set filetype=diff

" :SDP -> show svn diff to previous revision
command! SDP silent call s:RunShellCommand("svn diff -x -w -r PREV:BASE ".expand("%:p")) | set filetype=diff

command! -nargs=1 SDR silent call s:RunShellCommand("svn diff -x -w -r ".<args>.":BASE ".expand("%:p")) | set filetype=diff

" svn blame. select block in visual mode and type gl
vmap gl :<C-U>silent Shell svn blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

" access the apache access log
command! -nargs=1 AL silent call s:RunShellCommand("scp cit@".<q-args>.":/var/log/apache2/access.log /tmp/ && cat /tmp/access.log", "this param will open in the same window") | set filetype=apache_log

" access the apache access log
command! -nargs=1 ALB silent call s:RunShellCommand("scp cit@".<q-args>.":/var/log/apache2/access.log.1 /tmp/ && cat /tmp/access.log.1", "this param will open in the same window") | set filetype=apache_log

" better shell command
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline, ...)
    echo a:cmdline
    let expanded_cmdline = a:cmdline
    for part in split(a:cmdline, ' ')
        if part[0] =~ '\v[%#<]'
            let expanded_part = fnameescape(expand(part))
            let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
        endif
    endfor
    if a:0 == 0
        botright new
    endif
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
    "call setline(1, 'You entered:    ' . a:cmdline)
    "call setline(2, 'Expanded Form:  ' .expanded_cmdline)
    "call setline(3,substitute(getline(2),'.','=','g'))
    execute '$read !'. expanded_cmdline
    1
endfunction
