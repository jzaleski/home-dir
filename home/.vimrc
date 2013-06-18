filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype on

syntax on
set background=dark
set backspace=eol,indent,start
set encoding=utf-8
set incsearch
set laststatus=2
set nobackup
set nocompatible
set nohls
set notitle
set nowrap
set showmatch
set smartcase
set ttyfast
set visualbell
set wildmode=list:longest
set number
set hidden
set scrolloff=3
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Use spaces instead of TABs
set shiftwidth=2
set tabstop=2
set expandtab

" Ensure the sign-column is transparent
hi clear SignColumn

" Highlight leading/trailing white-space
hi SpecialKey ctermfg=red guibg=red
hi ExtraSpace ctermbg=red guibg=red
au BufRead,BufNew,BufNewFile * syn match ExtraSpace /^\s\+\|\s\+$/

" Right rule
set colorcolumn=81
hi ColorColumn ctermbg=lightblue ctermfg=red guibg=lightblue guifg=red

" Folds
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview
