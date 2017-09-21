" Paukuls (paukul@gmail.com) personal Vim color scheme based on
" https://github.com/hardcore/iTerm-colors
" and the railscasts color theme.
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "hardcore"

" Colors
" Foreground   #a0a0a0
" Background   #161616
" Highlight bg #505354
" Light Blue   #66d9ef 67
" Dark Green   #a1d052 71
" Red          #ff3c83 160
" Light Green  #afe459 118
" Dark Orange  #ffa542 130
" Purple       #b28bf8 91
" Grey         #708488 237
" Light Grey   #d6d5d1 214
" Pink         #ff669d 161
"
" Brown        #f2882d
" hot pink     #6D9CBE 161
" Tan          #FFC66D 180

hi Normal                    guifg=#f6f3e8 guibg=#161616
hi Cursor                    guibg=#d6d5d1
hi CursorLine                guibg=#505354 gui=NONE
hi LineNr                    guifg=#888888 guibg=#161616
hi Search                    guibg=#dfdb74
hi Visual                    guibg=#363983

" Folds
" -----
" line used for closed folds
hi Folded                    guifg=#F6F3E8 guibg=#444444 gui=NONE

" Misc
" ----
" directory names and other special names in listings
hi Directory                 guifg=#6D9CBE gui=NONE

" Popup Menu
" ----------
" normal item in popup
hi Pmenu                     guifg=#F6F3E8 guibg=#444444 gui=NONE
" selected item in popup
hi PmenuSel                  guifg=#000000 guibg=#A5C261 gui=NONE
" scrollbar in popup
hi PMenuSbar                 guibg=#5A647E gui=NONE
" thumb of the scrollbar in the popup
hi PMenuThumb                guibg=#AAAAAA gui=NONE


"rubyComment
hi Comment                   guifg=#505354 gui=italic
hi rubyComment               guifg=#336699 gui=italic
hi Todo                      guifg=#ff669d guibg=NONE gui=italic

"rubyPseudoVariable
"nil, self, symbols, etc
hi Constant                  guifg=#6D9CBE

"rubyClass, rubyModule, rubyDefine
"def, end, include, etc
hi Define                    guifg=#ffa542

"rubyInterpolation
hi Delimiter                 guifg=#519F50

"rubyError, rubyInvalidVariable
hi Error                     guifg=#FFFFFF guibg=#990000

"rubyFunction
hi Function                  guifg=#FFC66D gui=NONE

"rubyIdentifier
"@var, @@var, $var, etc
hi Identifier                guifg=#66d9ef gui=NONE

"rubyInclude
"include, autoload, extend, load, require
hi Include                   guifg=#ffa542 gui=NONE

"rubyKeyword, rubyKeywordAsMethod
"alias, undef, super, yield, callcc, caller, lambda, proc
hi Keyword                   guifg=#CC7833

" same as define
hi Macro                     guifg=#CC7833 gui=NONE

"rubyInteger
hi Number                    guifg=#A5C261

" #if, #else, #endif
hi PreCondit                 guifg=#CC7833 gui=NONE

" generic preprocessor
hi PreProc                   guifg=#CC7833 gui=NONE

"rubyControl, rubyAccess, rubyEval
"case, begin, do, for, if unless, while, until else, etc.
hi Statement                 guifg=#CC7833 gui=NONE

"rubyString
hi String                    guifg=#afe459

hi Title                     guifg=#FFFFFF

"rubyConstant
hi Type                      guifg=#ff3c83 gui=NONE

hi DiffAdd                   guifg=#E6E1DC guibg=#144212
hi DiffDelete                guifg=#E6E1DC guibg=#660000

hi link htmlTag              xmlTag
hi link htmlTagName          xmlTagName
hi link htmlEndTag           xmlEndTag

hi xmlTag                    guifg=#E8BF6A ctermfg=234
hi xmlTagName                guifg=#E8BF6A
hi xmlEndTag                 guifg=#E8BF6A

if &t_Co > 255
  hi Normal                    ctermfg=255 ctermbg=233
  hi Cursor                    ctermbg=255
  hi CursorLine                ctermbg=234 cterm=NONE
  hi LineNr                    ctermfg=242 ctermbg=234
  hi Search                    ctermbg=67
  hi Visual                    ctermbg=67

  " Folds
  " -----
  " line used for closed folds
  hi Folded                    ctermfg=254 ctermbg=214 cterm=NONE

  " Misc
  " ----
  " directory names and other special names in listings
  hi Directory                 ctermfg=161 cterm=NONE

  " Popup Menu
  " ----------
  " normal item in popup
  hi Pmenu                     ctermfg=242 ctermbg=234
  " selected item in popup
  hi PmenuSel                  ctermfg=16 ctermbg=250
  " scrollbar in popup
  hi PMenuSbar                 ctermbg=237
  " thumb of the scrollbar in the popup
  hi PMenuThumb                ctermbg=239


  "rubyCommen TODO: t
  hi Comment                   ctermfg=237
  hi rubyComment               ctermfg=223
  hi Todo                      ctermfg=161 ctermbg=NONE

  "rubyPseudoVariable
  "nil, self, symbols, etc
  hi Constant                  ctermfg=67

  "rubyClass, rubyModule, rubyDefine
  "def, end, include, etc
  hi Define                    ctermfg=130

  "rubyInterpolation
  hi Delimiter                 ctermfg=71

  "rubyError, rubyInvalidVariable
  hi Error                     ctermfg=255 ctermbg=160

  "rubyFunction
  hi Function                  ctermfg=180 cterm=NONE

  "rubyIdentifier
  "@var, @@var, $var, etc
  hi Identifier                ctermfg=69 cterm=NONE

  "rubyInclude
  "include, autoload, extend, load, require
  hi Include                   ctermfg=130 cterm=NONE

  "rubyKeyword, rubyKeywordAsMethod
  "alias, undef, super, yield, callcc, caller, lambda, proc
  hi Keyword                   ctermfg=130

  " same as define
  hi Macro                     ctermfg=130 cterm=NONE

  "rubyInteger
  hi Number                    ctermfg=30

  " #if, #else, #endif
  hi PreCondit                 ctermfg=130 cterm=NONE

  " generic preprocessor
  hi PreProc                   ctermfg=209 cterm=NONE

  "rubyControl, rubyAccess, rubyEval
  "case, begin, do, for, if unless, while, until else, etc.
  hi Statement                 ctermfg=130 cterm=NONE

  "rubyString
  hi String                    ctermfg=118

  hi Title                     ctermfg=16

  "rubyConstant
  hi Type                      ctermfg=161 cterm=NONE

  hi DiffAdd                   ctermfg=252 ctermbg=71
  hi DiffDelete                ctermfg=252 ctermbg=204

  hi htmlH1               guifg=#f6f3e8
  hi link htmlTag              xmlTag
  hi link htmlTagName          xmlTagName
  hi link htmlEndTag           xmlEndTag

  hi xmlTag                    ctermfg=180
  hi xmlTagName                ctermfg=180
  hi xmlEndTag                 ctermfg=180

  hi markdownH1 ctermfg=85
  hi markdownH2 ctermfg=85
  hi markdownH3 ctermfg=85
  hi markdownH4 ctermfg=85
  hi markdownH5 ctermfg=85

  hi coffeeComment ctermfg=223
end
