" Karl-Martin Skontorp <kms@skontorp.net>  (http://skontorp.net/dot-files/)
" Last modified: Wed Jan  9 15:58:03 2002

" Remove all existing highlighting.
set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "kms"

" My colors
hi nontext ctermfg=blue
hi Folded term=standout ctermfg=black ctermbg=yellow
"hi StatusLine term=standout ctermfg=black ctermbg=yellow
