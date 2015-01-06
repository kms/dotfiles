" ~/.vimrc
" Karl-Martin Skontorp <kms@skontorp.net> ~ http://22pf.org/
"
" Install Vundle: (See https://github.com/gmarik/vundle)
"   git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim
"   vim +PluginInstall +qall

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
set expandtab
set nostartofline
set whichwrap=<,>,h,l
set lcs=tab:\ \ ,trail:­
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
set listchars+=precedes:«,extends:»
set history=2048
set ttimeoutlen=50
set t_Co=256


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

colorscheme defaultimproved
highlight clear SignColumn
highlight SignColumn ctermbg=black

"colorscheme molokai

set background=dark

set number

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'bufexplorer.zip'
Plugin 'chrisbra/csv.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'majutsushi/tagbar'
Plugin 'matchit.zip'
Plugin 'milkypostman/vim-togglelist'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
"Plugin 'Valloric/YouCompleteMe'
call vundle#end()

filetype plugin indent on

let g:airline#extensions#tabline#enabled = 1
let g:gitgutter_sign_column_always = 1

" Increase speed
"let g:gitgutter_realtime = 0
"let g:gitgutter_eager = 0

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:toggle_list_no_mappings = 1

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


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
