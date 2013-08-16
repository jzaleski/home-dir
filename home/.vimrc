filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect()
filetype on

syntax on
set background=dark
set backspace=eol,indent,start
set cursorline
set encoding=utf-8
set hidden
set incsearch
set laststatus=2
set nobackup
set nocompatible
set nohls
set notitle
set nowrap
set number
set scrolloff=3
set showmatch
set smartcase
set t_Co=256
set ttyfast
set visualbell
set wildmode=list:longest
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Use spaces instead of TABs
set shiftwidth=2
set tabstop=2
set expandtab

" Ensure the sign-column is transparent
hi clear SignColumn

" Highlight leading/trailing white-space
hi SpecialKey ctermfg=1
hi ExtraSpace ctermbg=1
au BufRead,BufNew,BufNewFile * syn match ExtraSpace /^\s\+\|\s\+$/

" Right rule
set colorcolumn=81
hi ColorColumn ctermbg=80 ctermfg=52

" Cursor line
hi CursorLine cterm=NONE ctermbg=8
hi CursorColumn cterm=NONE ctermbg=8

" Folds
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview
