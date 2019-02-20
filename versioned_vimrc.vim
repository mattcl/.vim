scriptencoding utf-8
set encoding=utf-8
set nocompatible
filetype off
set number
syntax off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" Plugin 'fatih/vim-hclfmt'
Plugin 'b4b4r07/vim-hcl'
Plugin 'baskerville/bubblegum'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'dougireton/vim-chef'
Plugin 'fatih/vim-go'
Plugin 'FooSoft/vim-argwrap'
Plugin 'glts/vim-magnum'
Plugin 'glts/vim-radical'
Plugin 'godlygeek/tabular'
Plugin 'goldfeld/vim-seek'
" Plugin 'hdima/python-syntax'
Plugin 'jceb/vim-orgmode'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'junegunn/seoul256.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'Keithbsmiley/rspec.vim'
Plugin 'kh3phr3n/python-syntax'
" Errors with this under ubuntu 18.04
" Plugin 'klen/python-mode'
Plugin 'lervag/vimtex'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'maralla/completor.vim'
Plugin 'markcornick/vim-terraform'
Plugin 'mattn/calendar-vim'
Plugin 'mattn/emmet-vim'
Plugin 'metakirby5/codi.vim'
Plugin 'mileszs/ack.vim'
Plugin 'morhetz/gruvbox'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'myusuf3/numbers.vim'
" Plugin 'neomake/neomake'
Plugin 'noprompt/vim-yardoc'
Plugin 'reedes/vim-lexical'
Plugin 'reedes/vim-litecorrect'
Plugin 'reedes/vim-pencil'
" Plugin 'reedes/vim-textobj-sentence'
Plugin 'rodjek/vim-puppet'
Plugin 'rust-lang/rust.vim'
" Plugin 'scrooloose/syntastic'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'SirVer/ultisnips'
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
" Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/ListToggle'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'vim-python/python-syntax'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/utl.vim'
Plugin 'w0ng/vim-hybrid'
Plugin 'w0rp/ale'
Plugin 'wellle/targets.vim'
Plugin 'zeis/vim-kolor'

call vundle#end()

" ruby syntax highlighting sucks right now with the new engine
set regexpengine=1

"
let g:virtualenv_auto_activate = 1

" fzf
set rtp+=~/.fzf

let g:org_aggressive_conceal = 0

let g:markdown_syntax_conceal = 0

syntax on
filetype on
filetype plugin indent on
set t_Co=256

set background=dark

let g:seoul256_background=233
let g:gruvbox_italic=0
let g:gruvbox_contrast_dark=1

" don't display '|' characters on vertical splits
" There is a significant space after the backslash
set fillchars+=vert:\ | " the '|' here separates commands

set cursorline
set colorcolumn=80
set spell spelllang=en_us
set spellcapcheck=

set ttimeoutlen=50

let python_self_cls_highlight = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='tomorrow'

" set leader to ','
let mapleader=','

" set localleader
let maplocalleader=','

" disable emmet
let g:user_emmet_install_global = 0

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
autocmd Filetype hcl setlocal ts=2 sts=2 sw=2
autocmd Filetype java setlocal ts=4 sts=4 sw=4 colorcolumn=120
autocmd Filetype php set omnifunc=phpcomplete#CompletePHP

" set dispatch for file types
autocmd FileType python let b:dispatch = 'python %'
autocmd FileType ruby let b:dispatch = 'ruby %'
autocmd FileType puppet let b:dispatch = 'vagrant provision'

autocmd FileType eruby,html,css EmmetInstall

augroup prose
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
                            \ | call lexical#init()
                            \ | call litecorrect#init()
augroup END

" neomake
let g:neomake_open_list = 2

autocmd Filetype rust nnoremap <buffer> <leader>z :Neomake! cargo<CR>

" commentary
autocmd FileType rust setlocal commentstring=//\ %s

" goyo
function! s:goyo_enter()
  NumbersDisable
  set nonumber
  set norelativenumber
  Limelight
endfunction

function! s:goyo_leave()
  Limelight!
  set number
  set relativenumber
  NumbersEnable
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" dispatch default bindings
nnoremap <F9> :Dispatch<CR>
nnoremap <leader>r :Dispatch<CR>

" ale checkers
let g:ale_linters = {
\  'python': ['flake8'],
\}

let g:ale_lint_delay = 300
let g:ale_sign_column_always = 1
let g:ale_set_quickfix = 1
let g:airline#extensions#ale#enabled = 1


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
try
  let g:ycm_rust_src_path = systemlist('rustc --print sysroot')[0] . '/lib/rustlib/src/rust/src'
catch
endtry
let g:EclimCompletionMethod = 'omnifunc'

" completer
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
let g:completor_racer_binary = '/home/matt/.cargo/bin/racer'
let g:completor_python_binary = 'python'

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

" FZF
" let $FZF_DEFAULT_COMMAND = 'ag -l -g "" --path-to-agignore=~/.agignore'
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'

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
    execute ':FZF ' . fnamemodify(fzf_marker, ':p:h')
  elseif empty(matchstr(gitparent, '^fatal:.*'))
    execute ':FZF ' . gitparent
  else
    execute ':FZF .'
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

" quickfix and loc list
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'

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

" grep
set grepprg=rg\ --vimgrep

xmap <silent> <leader>g :call GrepSelected()<CR>

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

command! -bang -nargs=* FindIgnore call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

function! GrepSelected()
  silent execute ':Find '.<sid>get_visual_selection()
endfunction

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

function! s:get_visual_selection()
  " Why is this not a built-in Vim script function?!
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction

" commentary stuff that was removed, but I'm too used to the old keybindings
if maparg('\\','n') ==# '' && maparg('\','n') ==# '' && get(g:, 'commentary_map_backslash', 1)
  xmap \\  gc<CR>
  nmap \\  gc<CR>
  nmap \\\ gc<CR>
  nmap \\u gc<CR>
endif

" Colorscheme switching bullshit
if !exists('s:known_links')
	let s:known_links = {}
endif

function! s:Find_links() " {{{1
	" Find and remember links between highlighting groups.
	redir => listing
	try
		silent highlight
	finally
		redir END
	endtry
	for line in split(listing, "\n")
		let tokens = split(line)
		" We're looking for lines like "String xxx links to Constant" in the
		" output of the :highlight command.
		if len(tokens) == 5 && tokens[1] == 'xxx' && tokens[2] == 'links' && tokens[3] == 'to'
			let fromgroup = tokens[0]
			let togroup = tokens[4]
			let s:known_links[fromgroup] = togroup
		endif
	endfor
endfunction

function! s:Restore_links() " {{{1
	" Restore broken links between highlighting groups.
	redir => listing
	try
		silent highlight
	finally
		redir END
	endtry
	let num_restored = 0
	for line in split(listing, "\n")
		let tokens = split(line)
		" We're looking for lines like "String xxx cleared" in the
		" output of the :highlight command.
		if len(tokens) == 3 && tokens[1] == 'xxx' && tokens[2] == 'cleared'
			let fromgroup = tokens[0]
			let togroup = get(s:known_links, fromgroup, '')
			if !empty(togroup)
				execute 'hi link' fromgroup togroup
				let num_restored += 1
			endif
		endif
	endfor
endfunction

function! s:AccurateColorscheme(colo_name)
	call <SID>Find_links()
	exec "colorscheme " a:colo_name
	call <SID>Restore_links()
endfunction

command! -nargs=1 -complete=color MyColorscheme call <SID>AccurateColorscheme(<q-args>)

" try-catch here to solve chicken and egg problem when chef installs plugins
" on a new machine
try
  " colorscheme seoul256
  let g:gruvbox_guisp_fallback = "bg"
  MyColorscheme gruvbox
  " colorscheme kolor
  " colorscheme xoria256
catch
endtry

" Limelight additional stuff
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" " Default: 0.5
" let g:limelight_default_coefficient = 0.7

" " Number of preceding/following paragraphs to include (default: 0)
" let g:limelight_paragraph_span = 1

" " Beginning/end of paragraph
" "   When there's no empty line between the paragraphs
" "   and each paragraph starts with indentation
" let g:limelight_bop = '^\s'
" let g:limelight_eop = '\ze\n^\s'

" " Highlighting priority (default: 10)
" "   Set it to -1 not to overrule hlsearch
" let g:limelight_priority = -1
