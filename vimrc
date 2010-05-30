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

" gvim options
set guioptions-=T  "remove toolbar

" peaksea colours
if ! has("gui_running") 
    set t_Co=256 
endif 
set background=dark 
colors peaksea 

source ~/.vim/php.vim
