set nocompatible
filetype off
set number
syntax off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

Plugin 'FooSoft/vim-argwrap'
Plugin 'Keithbsmiley/rspec.vim'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'b4b4r07/vim-hcl'
Plugin 'baskerville/bubblegum'
Plugin 'bling/vim-airline'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'dougireton/vim-chef'
Plugin 'fatih/vim-go'
Plugin 'godlygeek/tabular'
Plugin 'goldfeld/vim-seek'
Plugin 'jceb/vim-orgmode'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'junegunn/seoul256.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'klen/python-mode'
Plugin 'lervag/vimtex'
Plugin 'markcornick/vim-terraform'
Plugin 'mattn/calendar-vim'
Plugin 'mattn/emmet-vim'
Plugin 'mileszs/ack.vim'
Plugin 'morhetz/gruvbox'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'myusuf3/numbers.vim'
Plugin 'noprompt/vim-yardoc'
Plugin 'rodjek/vim-puppet'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/syntastic'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vividchalk'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/utl.vim'
Plugin 'w0ng/vim-hybrid'
Plugin 'wellle/targets.vim'
Plugin 'zeis/vim-kolor'

call vundle#end()

let $FZF_DEFAULT_COMMAND = 'ag -l -g "" --path-to-agignore=~/.agignore'

" fzf
set rtp+=~/.fzf

syntax on
filetype on
filetype plugin indent on
set t_Co=256

set background=dark

let g:seoul256_background=233
let g:gruvbox_italic=0
let g:gruvbox_contrast_dark=1

" try-catch here to solve chicken and egg problem when chef installs plugins
" on a new machine
try
  " colorscheme seoul256
  colorscheme gruvbox
  " colorscheme kolor
  " colorscheme xoria256
catch
endtry

" don't display '|' characters on vertical splits
" There is a significant space after the backslash
set fillchars+=vert:\ | " the '|' here separates commands

set cursorline
set colorcolumn=80
set spell spelllang=en_us
set spellcapcheck=

set ttimeoutlen=50

" let python_highlight_all = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='tomorrow'

" set leader to ','
let mapleader=','

" set localleader
let maplocalleader=','



" set indentation for special file types
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype python setlocal ts=4 sts=4 sw=4
autocmd Filetype json setlocal ts=4 sts=4 sw=4
autocmd Filetype eruby setlocal ts=2 sts=2 sw=2
autocmd Filetype cucumber setlocal ts=2 sts=2 sw=2
autocmd Filetype coffee setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
autocmd Filetype go setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd Filetype org setlocal ts=2 sts=2 sw=2
autocmd Filetype php set omnifunc=phpcomplete#CompletePHP

" set dispatch for file types
autocmd FileType python let b:dispatch = 'python %'
autocmd FileType ruby let b:dispatch = 'ruby %'
autocmd FileType puppet let b:dispatch = 'vagrant provision'

" commentary
autocmd FileType rust setlocal commentstring=//\ %s

" dispatch default bindings
nnoremap <F9> :Dispatch<CR>
nnoremap <leader>r :Dispatch<CR>

" syntastic checkers
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_puppet_checkers = ['puppetlint']
let g:syntastic_python_checkers = ['flake8']
" let g:syntastic_ruby_checkers = ['rubocop']
" let g:syntastic_ruby_rubocop_exec = '/home/matt/scripts/rubocop.sh'

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

" pymode
" Disable most of the completion and linting, as I'm relying on syntastic/jedi
let g:pymode_lint = 0
let g:pymode_folding = 0
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_lint_cwindow = 0
let g:pymode_options_max_line_length = 119
let g:pymode_rope = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_completion = 0

" utl
let g:utl_cfg_hdl_scm_http = ":Start! google-chrome '%u'"

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

" FZF
function FuzzyFind()
  " Contains a null-byte that is stripped.
  let gitparent=system('git rev-parse --show-toplevel')[:-2]

  " search for .fzf files
  if empty(matchstr(gitparent, '^fatal:.*'))
    let fzf_marker_stop_dir=gitparent
  else
    let fzf_marker_stop_dir=''
  endif
  let fzf_marker=findfile('.fzf', '.;' . fzf_marker_stop_dir)

  " if a .fzf file exists, it overrides the git repo
  if !empty(fzf_marker)
    silent execute ':FZF ' . fnamemodify(fzf_marker, ':p:h')
  elseif empty(matchstr(gitparent, '^fatal:.*'))
    silent execute ':FZF ' . gitparent
  else
    silent execute ':FZF .'
  endif
endfunction

nmap <c-p> :call FuzzyFind()<cr>

" Search lines in all open buffers
function! s:line_handler(l)
  let keys = split(a:l, ':\t')
  exec 'buf' keys[0]
  exec keys[1]
  normal! ^zz
endfunction

function! s:buffer_lines()
  let res = []
  for b in filter(range(1, bufnr('$')), 'buflisted(v:val)')
    call extend(res, map(getbufline(b,0,"$"), 'b . ":\t" . (v:key + 1) . ":\t" . v:val '))
  endfor
  return res
endfunction

command! FZFLines call fzf#run({
\   'source':  <sid>buffer_lines(),
\   'sink':    function('<sid>line_handler'),
\   'options': '--extended --nth=3..',
\   'down':    '60%'
\})

nmap <leader>g :FZFLines<cr>

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <c-i> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

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

" close quickfix
nnoremap <Leader>q :ccl<cr>

" show invisible characters
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·
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

" argwrap
nnoremap <silent> <leader>c :ArgWrap<CR>

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

" python-mode overrides
let g:pymode_run_bind = '<C-S-F8>'

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

" silent with redraw
command! -nargs=1 Silent
  \ | execute ':silent !'.<q-args>
  \ | execute ':redraw!'

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
