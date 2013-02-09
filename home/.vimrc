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

" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

" Helper Function for getting the current directory
function! CurDir()
  let curdir = substitute(getcwd(), $HOME, "~", "g")
  return curdir
endfunction

" Helper Function for determining if we are in 'PASTE MODE'
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  else
    return ''
  endif
endfunction

" Update highlighting rules
set list
set listchars=eol:$,tab:o-,extends:>,precedes:<
hi SpecialKey guifg=red ctermfg=red
hi ExtraSpace ctermbg=red guibg=red
au BufRead,BufNew,BufNewFile *.{css,erb,htm,html,js,pm,pl,py,rb,sh,sql,xml} syn match ExtraSpace /^\zs \+\|\t\+\zs \+\| \+\ze\t\|\zs\s\+$/

" The following two options will save the fold-state
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

" Required for 'matchit.vim'
filetype plugin on
