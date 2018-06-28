" .vimrc
" Vasyl Romanchak
" Plugins {{{
" Set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

" Navigation
Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'mileszs/ack.vim'
Plug '/usr/local/opt/fzf'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Themes
Plug 'nanotech/jellybeans.vim'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'

" Web Development
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'ap/vim-css-color'

call plug#end()
" }}}
" Vim startup {{{
" Open current directory within NERDTree by default without need to point onto
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>
" }}}
" General Settings {{{
set nocompatible
set nocp
set autoindent
set mouse=
set scrolloff=999
set virtualedit=onemore
set undolevels=5000
set list
filetype off

set laststatus=2 " always show status line
set showcmd

set nowrap
set textwidth=0
" }}}
" Backup Settings {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}
" Editing {{{
set tabstop=4
set softtabstop=4
set expandtab
" }}}
" Movement {{{
" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" highlight last inserted text
nnoremap gV `[v`]

" easy motion
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1


" }}}
" Searching {{{
set incsearch " search as characters are entered
set hlsearch  " highlight matches

" Open new tab and search for something
nmap <leader>a :tab split<CR>:Ack ""<Left>

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" }}}
" Folding {{{
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
nnoremap <space> za
set foldlevelstart=10   " start with fold level of 1
" }}}
" Colors {{{
syntax enable
set termguicolors
" }}}
" Theme {{{
colorscheme jellybeans
" }}}
" UI {{{
set number            " show line numbers
set showcmd
set cursorline
filetype indent on
set wildmenu
set lazyredraw

" }}}
" Custom Functions {{{
function! <SID>ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc
" }}}
" Leader Shortcuts {{{
let mapleader=","       " leader is comma

nnoremap <leader>m :silent make\|redraw!\|cw<CR>
nnoremap <leader>l :call <SID>ToggleNumber()<CR>

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $HOME/.vimrc<CR>
nnoremap <leader>eb :vsp ~/.bash_profile<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" save session
nnoremap <leader>s :mksession<CR>

" split key movements
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Additional split options
set splitbelow
set splitright

" }}}
" Code Navigation {{{
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" }}}
" Cursor configuration {{{
" Use a blinking upright bar cursor in Insert mode, a solid block in normal
" and a blinking underline in replace mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[3 q"
let &t_EI = "\<Esc>[2 q"
" }}}
" Only for Mac users {{{
" to preven the terminal flash issue
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
" }}}
" vim:foldmethod=marker:foldlevel=0
