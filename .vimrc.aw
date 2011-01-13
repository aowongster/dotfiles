set nocompatible
syntax on

set tabstop=2
set shiftwidth=2
set expandtab

set nobackup
set noswapfile
set hidden
set ruler


set incsearch
set virtualedit=all
set showmatch
set autoindent
set number

set title

set pastetoggle=<F2>
nnoremap ; :
"not too sure about this mapleader stuff
let mapleader = ","

"disable arrow keys for the most part
"map <up> <nop>
"remap arrow keys to tab switching
map <up> <Esc>:tabfirst<CR>
map <down> <Esc>:tablast<CR>
map <left> <Esc>:tabp<CR>
map <right> <Esc>:tabn<CR>

imap ii <Esc>
hi Comment      ctermfg=darkcyan

"enabling skel docs
autocmd! BufNewFile * silent! 0r ~/.vim/skel/boiler.%:e
