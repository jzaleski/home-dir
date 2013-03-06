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

" Update highlighting rules
set list
set listchars=eol:$,tab:o-,extends:>,precedes:<
hi SpecialKey guifg=red ctermfg=red
hi ExtraSpace ctermbg=red guibg=red
au BufRead,BufNew,BufNewFile *.{css,erb,htm,html,js,pm,pl,py,rb,sh,sql,xml} syn match ExtraSpace /^\zs \+\|\t\+\zs \+\| \+\ze\t\|\zs\s\+$/

" The following two options will save the fold-state
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview
