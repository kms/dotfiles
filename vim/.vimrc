" ~/.vimrc
" Karl-Martin Skontorp <kms@skontorp.net> ~ http://22pf.org/
"
" Install vim-plug: (See )
"   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   vim +PlugInstall +qall

let php3_minlines=200
let java_allow_cpp_keywords=1
let mapleader = "\\"
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:airline_powerline_fonts=1

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
set noexpandtab
set nostartofline
set whichwrap=<,>,h,l
set hidden
set isfname-==
set tags=tags;/
syntax on
filetype indent on
filetype off
set ruler
set laststatus=2
set nowrap
set sidescroll=5
set listchars=precedes:«,extends:»,tab:»·,trail:·
set list
set history=2048
set ttimeoutlen=50
set t_Co=256

" Fold based on indents
"set foldmethod=indent
" Open all folds
"au BufReadPost * exec "normal zR"

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

set background=dark
"colorscheme defaultimproved
highlight clear SignColumn
highlight clear SpecialKey
highlight SignColumn ctermbg=black
highlight SpecialKey ctermfg=lightred

set number

set rtp+=~/.vim/bundle/Vundle.vim/

call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
"Plug 'bufexplorer.zip'
Plug 'kien/ctrlp.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'majutsushi/tagbar'
"Plug 'matchit.zip'
Plug 'milkypostman/vim-togglelist'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
"Plug 'Valloric/YouCompleteMe'
Plug 'ap/vim-css-color'
Plug 'tomasr/molokai'
call plug#end()

filetype plugin indent on

let g:airline#extensions#tabline#enabled = 1
set signcolumn=yes

" Increase speed
"let g:gitgutter_realtime = 0
"let g:gitgutter_eager = 0

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:toggle_list_no_mappings = 1

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:rehash256 = 1
colorscheme molokai

" <Leader><Leader>w osv. for easymotion
" V S<p> for surround-vim
" V <Leader>c space for comment toggle
" TODO:
"  * Colorscheme

map <F1> :NERDTreeToggle<CR>
map <F2> :BufExplorer<CR>
map <F3> :Tagbar<CR>
map <F4> :call ToggleQuickfixList()<CR>

" Reduce folding
"map <F2> zr
"map <S-F2> zR
" Increase folding
"map <F3> zm
"map <S-F3> zM

" Turn of search highlight
"map <F4> :noh<CR>

" ctags
map <F7> :!ctags --totals --recurse<CR>

" Reindent
map <F8> :call Reindent()<CR>

" cd to directory of current file
map <Leader>cd :cd %:p:h<cr>

" For easier re-formating of paragraphs
map <Leader>q gq

" Spell check of current buffer, american-english
map <Leader>se :w!<CR>:!aspell --lang=en_US check %<CR>:e! %<CR>
" Spell check of current buffer, norsk
map <Leader>sn :w!<CR>:!aspell --lang=no check %<CR>:e! %<CR>

" Movement
map <S-Home> gg
map <S-End> G

" Move between windows
map <M-Up> <Up>
map <M-Down> <Down>
map <M-Left> <Left>
map <M-Right> <Right>

" TAB is better than CTRL+]
map <TAB> 
map <S-Tab> :po<CR>
