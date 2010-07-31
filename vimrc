" ~/.vimrc should only source this file.
filetype off 
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

syntax on
filetype plugin indent on
set nocompatible
set hidden
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
au FileType xhtml,xml so ~/.vim/bundle/html_autoclose_tag/ftplugin/html_autoclosetag.vim

" format xml on load
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"
