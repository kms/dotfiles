" ~/.vimrc
" Karl-Martin Skontorp <kms@skontorp.net> ~ http://22pf.org/

let php3_minlines=200
let java_allow_cpp_keywords=1
let mapleader = ","
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

set autoindent
set autowrite
set backspace=indent,eol,start
set guioptions-=T
set ignorecase
set incsearch
set mousehide
set nocompatible
set noequalalways
set shiftwidth=4
set showcmd
set showmode
set textwidth=78
set viminfo='1024,\"8192,h,n~/.viminfo
set visualbell
set noerrorbells
set showmatch
set t_vb=
set wildmenu
set expandtab
set nostartofline
set whichwrap=<,>,h,l
set lcs=tab:\ \ ,trail:­
set hidden
set isfname-==
set tags=tags;/
syntax on
filetype indent on
set ruler
set laststatus=2
"set statusline=%<%f\ %h%w%m%r%y%=L:%l/%L\ (%p%%)\ C:%c%V\ B:%o\ F:%{foldlevel('.')}
set nowrap
set sidescroll=5
set listchars+=precedes:«,extends:»
set history=2048
set ttimeoutlen=50
set t_Co=256


" -- Key mapping --
" Reduce folding
map <F2> zr
map <S-F2> zR
" Increase folding
map <F3> zm
map <S-F3> zM

" Turn of search highlight
map <F4> :noh<CR>

" Explorer
map <F5> :BufExplorer<CR>
map <F6> :Explore<CR>

" ctags
map <F7> :!ctags --totals --recurse<CR>

" Reindent
map <F8> :call Reindent()<CR>

" TAB is better than CTRL+]
map <TAB> 
map <S-Tab> :po<CR>

" cd to directory of current file
map <silent> ,cd :cd %:p:h<cr>

" For easier re-formating of paragraphs
map Q gq

" Spell check of current buffer, american-english
map  :w!<CR>:!aspell --lang=en_US check %<CR>:e! %<CR>
" Spell check of current buffer, norsk
map  :w!<CR>:!aspell --lang=no check %<CR>:e! %<CR>

" Movement
map <S-Home> gg
map <S-End> G

" Move between windows
map <M-Up> <Up>
map <M-Down> <Down>
map <M-Left> <Left>
map <M-Right> <Right>

" Fold based on indents
set foldmethod=indent
" Open all folds
au BufReadPost * exec "normal zR"

" Jump to last known position if '-mark is set
augroup mark
    autocmd!
    autocmd BufReadPost * if (line("'\"") && match(bufname("%"), $VIMRUNTIME)) | exec "normal '\"" | endif
augroup END

" Reindent everything
function! Reindent()
    exec "normal ms"
    exec "normal gg=G"
    exec "normal 's"
endfunction

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'majutsushi/tagbar'
Bundle 'bling/vim-airline'
Bundle 'Shougo/unite.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'

filetype plugin indent on     " required!
