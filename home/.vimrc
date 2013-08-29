" Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" Colorscheme
set background=dark
if !has('gui_running')
  set t_Co=256
  let g:solarized_termcolors=&t_Co
endif
colorscheme solarized

" Ensure that the line-number background is transparent
hi clear LineNr

" Ensure that the sign-column background is transparent
hi clear SignColumn

" Highlight leading/trailing white-space
hi SpecialKey ctermfg=1
hi ExtraSpace ctermbg=1
au BufRead,BufNew,BufNewFile * syn match ExtraSpace /^\s\+\|\s\+$/

" Right rule
set colorcolumn=81

" General
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
set ttyfast
set visualbell
set wildmode=list:longest
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Use spaces instead of TABs
set shiftwidth=2
set tabstop=2
set expandtab

" Folds
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

" Lightline
let g:lightline = {
  \ 'colorscheme': 'solarized_dark',
  \ 'active': {
  \   'left': [
  \      ['mode', 'paste'],
  \      ['fugitive', 'readonly', 'filename', 'modified']
  \   ]
  \ },
  \ 'component': {
  \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
  \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
  \ },
  \ 'component_visible_condition': {
  \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
  \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
  \ }
\ }
