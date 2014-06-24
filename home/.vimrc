" Pathogen
execute pathogen#infect()
syntax on
filetype indent on
filetype plugin on

" Uncomment the following two lines if the color-pallette seems off
"set t_Co=256
"let g:solarized_termcolors=&t_Co

" Colorscheme
set background=dark
colorscheme solarized

" Ensure that the line-number background is transparent
hi clear LineNr

" Ensure that the sign-column background is transparent
hi clear SignColumn

" Highlighting rule to catch leading/trailing whitespace
au BufRead,BufNew,BufNewFile * syn match ExtraSpace /^\s\+\|\s\+$/

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
set showmatch
set showtabline=2
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

" GUI specific ({g,Mac}Vim)
if has('gui_running')
  set guioptions-=r
endif

" Folds
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

" Toggle Highlight-Whitespace Helper
function! ToggleHighlightWhitespace()
  if !exists('g:highlight_whitespace')
    let g:highlight_whitespace=0
  end
  if g:highlight_whitespace
    hi clear ExtraSpace
    let g:highlight_whitespace=0
  else
    hi ExtraSpace ctermbg=1 guibg=red
    let g:highlight_whitespace=1
  endif
  redraw!
endfunction
map <F3> :call ToggleHighlightWhitespace()<CR>

" Toggle Line-Numbers Helper
function! ToggleLineNumbers()
  set number!
  redraw!
endfunction
map <F4> :call ToggleLineNumbers()<CR>

" Toggle Paste-Mode Helper
function! TogglePasteMode()
  set paste!
  redraw!
endfunction
map <F2> :call TogglePasteMode()<CR>

" Find in Files
command -nargs=+ -complete=file -bar FindInFiles silent! grep! <args>|cwindow|redraw!
map <C-S-F> :FindInFiles<SPACE>

" Find All References
map <C-K> :grep! "\b<C-R><C-W>\b"<CR>:cw<CR><CR>

" Toggle the Location and Quickfix windows
function! GetBufferList()
  redir =>buflist
  silent! ls
  redir END
  return buflist
endfunction
function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
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
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction
nmap <silent> <Leader>g :call ToggleList("Location List", 'l')<CR>
nmap <silent> <Leader>q :call ToggleList("Quickfix List", 'c')<CR>

" ctrlp
let g:ctrlp_root_markers = ['.ctrlp']
let g:ctrlp_working_path_mode = 'rw'
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore\ tags
  let g:ctrlp_user_command='ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching=0
endif

" lightline
function! CurrentFilename()
  return ('' != expand('%:p') ? substitute(expand('%:p'), expand('$HOME'), '~', 'g') : '[No Name]')
endfunction
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
  \ 'component_function': {
  \   'filename': 'CurrentFilename'
  \ },
  \ 'component_visible_condition': {
  \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
  \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
  \ }
\ }

" syntastic
let g:syntastic_always_populate_loc_list=1

" vim-easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0
nmap s <Plug>(easymotion-s2)
map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-lineforward)

" vim-rspec mappings
let g:rspec_command = "Dispatch rspec {spec}"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" vim-slime
let g:slime_target = 'tmux'
let g:slime_default_config = {
  \ 'socket_name': 'default',
  \ 'target_pane': ':0.1'
\ }

" Get off my lawn (force use of home-row)
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Move the currentl line to the center of the screen
nnoremap <SPACE> zvzz

" Buffer/Tab manipulation
nnoremap tn :tabnext<CR>
nnoremap to :tabnew<CR>
nnoremap tp :tabprevious<CR>
nnoremap tw :tabclose<CR>
nnoremap bn :bnext<CR>
nnoremap bp :bprevious<CR>
nnoremap bw :bwipeout<CR>
nnoremap bl :buffers<CR>

" Load ctags for gems
autocmd FileType ruby let &l:tags = pathogen#legacyjoin(pathogen#uniq(
  \ pathogen#split(&tags) +
  \ map(split($GEM_PATH,':'),'v:val."/gems/*/tags"')))
