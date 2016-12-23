" Pathogen
execute pathogen#infect()
syntax on
filetype indent on
filetype plugin on

" Comment out the following 2 lines if you are using the solarized color-scheme
set t_Co=256
let g:solarized_termcolors=&t_Co

" Colorscheme
set background=dark
colorscheme solarized

" Ensure that the line-number background is transparent
hi clear LineNr

" Ensure that the sign-column background is transparent
hi clear SignColumn

" Right rule
set colorcolumn=81

" General
set backspace=eol,indent,start
set cursorline
set encoding=utf-8
set hidden
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set nobackup
set nocompatible
set nohlsearch
set noswapfile
set notitle
set nowrap
set number
set scrolloff=3
set shortmess=a
set showmatch
set showtabline=2
set smartcase
set ttyfast
set visualbell
set wildmode=list:longest
set backupdir=~/tmp,~/.vim/tmp,/tmp
set directory=~/tmp,~/.vim/tmp,/tmp

" Use spaces instead of TABs
set shiftwidth=2
set tabstop=2
set expandtab

" GUI specific ({g,Mac}Vim)
if has('gui_running')
  set guifont=PT\ Mono:h14
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
endif

" Folds
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

" Toggle Paste-Mode Helper
function! TogglePasteMode()
  set paste!
  redraw!
endfunction

" Toggle Highlight-Whitespace Helper
function! ToggleHighlightWhitespace()
  ToggleWhitespace
  redraw!
endfunction

" Toggle Indent-Guides Helper
function! ToggleIndentGuides()
  IndentGuidesToggle
  redraw!
endfunction

" Toggle Line-Numbers Helper
function! ToggleLineNumbers()
  set number!
  redraw!
endfunction

" Hotkeys/Toggles
map <F2> :call TogglePasteMode()<CR>
map <F3> :call ToggleHighlightWhitespace()<CR>
map <F4> :call ToggleIndentGuides()<CR>
map <F5> :call Make()<CR>
map <F6> :call MakeTest()<CR>
map <F7> :call ToggleLineNumbers()<CR>
map <F8> :call ToggleGitGutter()<CR>
map <F9> :call ToggleGitGutterLineHighlights()<CR>

" Find in Files
command -nargs=+ -complete=file -bar FindInFiles silent! grep! <args>|cwindow|redraw!
map <C-F> :FindInFiles<SPACE>

" Find All References
map <C-K> :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Make/MakeTest
set makeprg=$HOME/bin/make.sh
function! Make()
  execute 'make' | bwipeout
  redraw!
endfunction
function! MakeTest()
  execute 'make test' | bwipeout
  redraw!
endfunction

" Toggle the Location and Quickfix windows
function! GetBufferList()
  redir => buflist
  silent! ls
  redir END
  return buflist
endfunction
function! ToggleList(bufname, pfx)
  let buflist=GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr=winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction
nmap <silent> <Leader>g :call ToggleList("Location List", 'l')<CR>
nmap <silent> <Leader>q :call ToggleList("Quickfix List", 'c')<CR>

" CtrlP
let g:ctrlp_clear_cache_on_exit=1
let g:ctrlp_root_markers=['.ctrlp']
let g:ctrlp_show_hidden=1
let g:ctrlp_use_caching=1
let g:ctrlp_working_path_mode='rw'
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore\ tags
  let g:ctrlp_user_command='\ag %s -l --nocolor -g ""'
endif

" Indent Guides
let g:indent_guides_auto_colors=0
hi IndentGuidesOdd ctermbg=15 guibg=LightGrey
hi IndentGuidesEven ctermbg=7 guibg=White

" lightline
function! CurrentFilename()
  return ('' != expand('%:p') ? substitute(expand('%:p'), expand('$HOME'), '~', 'g') : '[No Name]')
endfunction
let g:lightline={
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
  \ 'component_function': {
  \   'filename': 'CurrentFilename'
  \ },
  \ 'component_visible_condition': {
  \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
  \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
  \ }
\ }

" syntastic
let g:loaded_syntastic_java_javac_checker=1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_open=0

" vim-slime
let g:slime_target='tmux'
let g:slime_default_config={
  \ 'socket_name': 'default',
  \ 'target_pane': ':0.1'
\ }

" Get off my lawn (force use of home-row)
map <Left> :echoe "Use h"<CR>
map <Right> :echoe "Use l"<CR>
map <Up> :echoe "Use k"<CR>
map <Down> :echoe "Use j"<CR>

" Move the currentl line to the center of the screen
map <SPACE> zvzz

" Buffer/Tab manipulation
map tn :tabnext<CR>
map to :tabnew<CR>
map tp :tabprevious<CR>
map tw :tabclose<CR>
map bn :bnext<CR>
map bp :bprevious<CR>
map bw :bwipeout<CR>
map bl :buffers<CR>

" Load ctags for gems
autocmd FileType ruby let &l:tags=pathogen#legacyjoin(pathogen#uniq(
  \ pathogen#split(&tags) +
  \ map(split($GEM_PATH, ':'),'v:val."/gems/*/tags"')))
