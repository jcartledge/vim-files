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
set autoread " detect when a file changes outside vim
set incsearch
set hlsearch
set wildmode=list:longest
set scrolloff=1

" change directory to current file
" @FIXME: doesn't work when a file is loaded from command line
if exists('+autochdir')
  set autochdir
else
  autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif

" gvim options
set guioptions-=T  "remove toolbar

" peaksea colours
set background=dark 
colors peaksea 

" map shortcuts for NerdTree and Taglist
map <F2> :NERDTreeToggle<CR>
map <F3> :TlistToggle<CR>

" taglist settings from http://www.vi-improved.org/vimrc.php
let Tlist_Auto_Open =          0
let Tlist_Compact_Format =     1
let Tlist_Enable_Fold_Column = 0 
let Tlist_Sort_Type =          "name"  
let Tlist_Use_Right_Window =   1  
let Tlist_WinWidth =           40 

" ctags: look for tags file in current directory, or recurse up
set tags=tags;/ 

" PHP stuff
source ~/.vim/php.vim
let tlist_php_settings =      'php;c:class;d:constant;f:function' 

" 20th century keymappings 
" @TODO: check if macmap.vim is available as well
source $VIMRUNTIME/mswin.vim

" better colours for omnicomplete
highlight PMenu      gui=bold guibg=LightSkyBlue4 guifg=honeydew2
highlight PMenuSel   gui=bold guibg=DarkGreen guifg=honeydew2
highlight PMenuSbar  gui=bold guibg=LightSkyBlue4
highlight PMenuThumb gui=bold guibg=DarkGreen

" xml tag autoclose
au FileType xhtml,xml so ~/.vim/ftplugin/html_autoclosetag.vim

imap <C-space> <c-x><c-o>
