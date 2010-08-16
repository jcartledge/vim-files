" ~/.vimrc should only source this file.

filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

syntax on
filetype plugin indent on
set nocompatible hidden number
set expandtab tabstop=2 shiftwidth=2
set autoindent smartindent
set autoread 
set incsearch hlsearch
set wildmode=list:longest
set scrolloff=1
set backspace=indent,eol,start whichwrap+=<,>,[,]

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
vnoremap <C-X> "+x
vnoremap <C-C> "+y
map <C-V> "+gP
cmap <C-V> <C-R>+
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
noremap <C-Q> <C-V>

" better colours for omnicomplete
highlight PMenu      gui=bold guibg=LightSkyBlue4 guifg=honeydew2
highlight PMenuSel   gui=bold guibg=DarkGreen guifg=honeydew2
highlight PMenuSbar  gui=bold guibg=LightSkyBlue4
highlight PMenuThumb gui=bold guibg=DarkGreen

" xml tag autoclose
au FileType xhtml,xml so ~/.vim/bundle/html_autoclosetag/ftplugin/html_autoclosetag.vim

" format xml on load
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

" alt-left alt-right to move through buffers
nmap <M-LEFT> :bN<cr>
nmap <M-RIGHT> :bn<cr>

" highlight whitespace
:set list listchars=tab:»·,trail:·
