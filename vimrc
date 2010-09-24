" ~/.vimrc should only source this file.

filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" change the mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" ; for commands
nnoremap ; :

" basic editor config
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
set nobackup noswapfile

" gvim options
if has("gui_running")
  set guioptions-=T  "remove toolbar
endif

" peaksea colours
set background=dark
if &t_Co >= 256 || has("gui_running")
  colors peaksea
endif

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
nmap <M-LEFT> :bN<CR>
nmap <M-RIGHT> :bn<CR>
imap <M-LEFT> <ESC>:bN<CR>
imap <M-RIGHT> <ESC>:bn<CR>

" highlight whitespace
:set list listchars=tab:»·,trail:·

" ./ to clear current search highlight
nmap <silent> ,/ :let @/=""<CR>

" save file with sudo
cmap w!! %!sudo tee > /dev/null %

" fuzzyfinder mappings from 
" http://stackoverflow.com/questions/1894614/vim-fuzzyfinder-usage-tips-gotchas-how-can-one-make-use-of-this-plugin/1897075#1897075
function IdeFindTextMate()
  let g:FuzzyFinderOptions.Base.key_open = '<CR>'
  let g:FuzzyFinderOptions.Base.key_open_split = '<C-j>'
  exe "FuzzyFinderTextMate"
endfunction

" ctrl-f is find file
map <silent> <C-F> :call IdeFindTextMate()<CR>
imap <silent> <C-F> <Esc>:call IdeFindTextMate()<CR>

" ,t is taglist
nmap <silent> <leader>t :TlistToggle<CR>

" ack command
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
