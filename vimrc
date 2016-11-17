set autowrite " Write the file when navigating to another buffer
set backspace=2
set backup
set backupcopy=auto,breakhardlink
set backupdir=/tmp
set comments=b:#,:%,fb:-,n:>,n:)
set cursorline
set directory=/tmp
set expandtab " Tabs instead of spaces
set foldcolumn=1
set guifont=Ubuntu\ Mono\ 10
set guioptions=caL
set helpheight=0 " Set to 0 disables help
set hidden " Switch between buffers when they're modified
set highlight=8r,db,es,hs,mb,Mr,nu,rs,sr,tb,vr,ws
set joinspaces " Insert two spaces after a period joining lines
set laststatus=2 " Show status line
set lazyredraw " No redraw on macros
set list
set listchars=tab:>.,trail:-
set magic " Use magic in search patterns
set modeline " Allow the last line to be a modeline
set nobackup
set nocompatible " No Vi compatible mode
set noerrorbells
set nohlsearch " Highlight search patterns
set noignorecase " Don't ignore case in search
set noinsertmode " Don't start in insert mode
set nonumber " Don't show line numbers
set nostartofline " Keep the cursor in the same place on page commands.
set nottybuiltin
set nowritebackup
set report=0 " Show a report when N lines were changed
set ruler " Show cursor position
set shell=zsh
set shiftwidth=4 " Number of spaces to use for each autoindent
set shortmess=Iat "Kind of messages to show
set showcmd " Show current uncompleted command
set showmatch " Show the matching bracket for the last ')'
set showmode " Show the current mode
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L]\ (%p%%)
set suffixes=.aux,.bak,.dvi,.gz,.idx,.log,.ps,.swp,.tar " Ignore these files
set tabstop=4
set tags=tags;$HOME/.vim/tags
set textwidth=90
set title titlestring=%t
set ttyfast
set ttyscroll=0 " Turn off scrolling (This is faster)
set visualbell t_vb= " No visual effects
set whichwrap=<,>
set wildchar=<TAB> " The char used for "expansion"
set wrapmargin=0

syntax on
filetype plugin indent on
match Error /\%>79v.\+/


" User specifics
" --------------
" These are completely preferential settings, specified by me.
colorscheme solarized
set background=dark

" For Dvorak keyboards
noremap d h
noremap h j
noremap t k
noremap n l
noremap f e
noremap e d
noremap l n


imap ii <C-[>  " No need to reach for escape
map <silent>,n :bnext<CR>
map <silent>,d :bprev<CR>
map <C-n> :cn<CR>
map <C-m> :cp<CR>
" Define "del" char to be the same backspace (saves a LOT of trouble!)
" As the angle notation cannot be use with the LeftHandSide
" with mappings you must type this in *literally*!
map <C-V>127 <C-H>
cmap <C-V>127 <C-H>

call plug#begin('~/.vim/plugged')
Plug 'vim-syntastic/syntastic'
Plug 'rust-lang/rust.vim'
call plug#end()

"
" This function allows me to get that neato dual pane window
"
set columns=90
let g:IDEified = 0
function! IDEify()
    if g:IDEified =~ 0
        set columns=180
        :90vs
        let g:IDEified = 1
    else
        set columns=90
        :bd
        let g:IDEified = 0
    endif
endfunction
command IDEify call IDEify()
map <F2> :IDEify<CR>


function! TabOrComplete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
endfunction
inoremap <Tab> <C-R>=TabOrComplete()<CR>

" Use WW when sudo is required for write. This was previously just W
" except that when I type fast or am on a slow system, I keep accidentally
" triggering this.
command! WW w !sudo tee % > /dev/null

" Syntastic
let syntastic_mode_map = { 'passive_filetypes': ['html'] }
let g:syntastic_html_checkers=['tidy']
let g:syntastic_css_checkers=['csslint']
let g:syntastic_erlang_checkers=['escript']
let g:syntastic_go_checkers=['gofmt']
let g:syntastic_haskell_checkers=['ghc-mod']
let g:syntastic_javascript_checkers=['jshint', 'jscs']
let g:syntastic_lua_checkers=['luac']
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args="--max-line-length=80 --ignore=D100,H302,H301,H404,D102"

let g:rustc_path='~/.cargo/bin/rustc'
let g:rustfmt_autosave = 1
let g:rustfmt_fail_silently = 1
