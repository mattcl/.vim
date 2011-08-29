
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
