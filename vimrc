" ~/.vimrc should only source this file.

syntax on
filetype plugin indent on
set nocompatible
set number
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set backspace=indent,eol,start
set autoread " detect when a file changes outside vim
set incsearch
set hlsearch

" gvim options
set guioptions-=T  "remove toolbar

" peaksea colours
set background=dark 
colors peaksea 

" map F2 to NerdTree
map <F2> :NERDTreeToggle<CR>

" ctags: look for tags file in current directory, or recurse up
set tags=tags;/ 

" PHP stuff
source ~/.vim/php.vim
