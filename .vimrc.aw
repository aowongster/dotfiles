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

" skel docs
"autocmd! BufNewFile test_* silent! 0r ~/.vim/skel/unit.py
autocmd BufNewFile * silent! 0r ~/.vim/skel/boiler.%:e
"autocmd BufNewFile *.py :tabnew test_%

" load new tab with test boiler, and set date in unit test , and wrap cmds in function

" header fill in
autocmd BufNewFile,BufRead * silent! exe "1," . 10 . "g/File Name:.*/s//File Name: ".expand("%")
autocmd BufNewFile * silent! exe "1," . 10 . "g/Created:.*/s//Created:   " .strftime("%d-%m-%Y")
autocmd BufWritePre,filewritepre * silent! :normal ma

autocmd Bufwritepre,filewritepre * silent! exe "1," . 10 . "g/Modified:.*/s//Modified:  " .strftime("%c")
autocmd bufwritepost,filewritepost * silent! :'a

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
