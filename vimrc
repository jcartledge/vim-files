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

" gvim options
set guioptions-=T  "remove toolbar

" peaksea colours
if ! has("gui_running") 
    set t_Co=256 
endif 
set background=dark 
colors peaksea 

" map F10 to NerdTree
map <F10> :NERDTreeToggle<CR>

" ctags: look for tags file in current directory, or recurse up
set tags=tags;/ 

" PHP stuff
source ~/.vim/php.vim
