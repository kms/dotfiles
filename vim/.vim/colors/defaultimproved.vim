" Vim color file, improved default
" Maintainer:	Karl-Martin Skontorp

" This is the default color scheme.  It doesn't define the Normal
" highlighting, it uses whatever the colors used to be.

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "defaultimproved"

"hi Comment ctermfg=26
"hi NoText ctermfg=26
"hi Directory ctermfg=26
"hi SpecialKey ctermfg=26
hi LineNr ctermfg=24
hi clear SignColumn

" vim: sw=2
