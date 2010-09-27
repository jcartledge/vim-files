" ~/.vimrc should only source this file.

filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" change the mapleader from \ to ,
let mapleader=","

" here
let $MYVIMRC=expand('<sfile>:p')
let $VIMHOME=expand('<sfile>:p:h')

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :split $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" ; for commands
nnoremap ; :

" basic editor config
syntax on
filetype plugin indent on
set nocompatible hidden number
set expandtab tabstop=2 shiftwidth=2
set autoindent smartindent
" set gdefault " this seems handy, but too abnormal
set autoread
set incsearch hlsearch showmatch
set ignorecase smartcase
set wildmode=list:longest
set scrolloff=1
set backspace=indent,eol,start whichwrap+=<,>,[,]
set nobackup noswapfile
set encoding=utf-8

" gvim options
if has("gui_running")
  set guioptions-=T  "remove toolbar
endif

" colours
set background=dark
if &t_Co >= 256 || has("gui_running")
  colorscheme jellybeans
endif

" ctags: look for tags file in current directory, or recurse up
set tags=tags;/

" PHP stuff
source ~/.vim/php.vim

" tlist
let Tlist_Php_Settings = 'php;c:class;d:constant;f:function'
let Tlist_Enable_Fold_Column = 0

" 20th century keymappings
vnoremap <C-X> "+x
vnoremap <C-C> "+y
map <C-V> "+gP
cmap <C-V> <C-R>+
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
noremap <C-Q> <C-V>

" xml tag autoclose
au FileType xhtml,xml so ~/.vim/bundle/html_autoclosetag/ftplugin/html_autoclosetag.vim

" format xml on load
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

" alt-arrow to navigate buffers
nmap <M-Left>   :bN<CR>
nmap <M-Right>  :bn<CR>
imap <M-Left>   <ESC>:bN<CR>
imap <M-Right>  <ESC>:bn<CR>

" shift-arrow to navigate windows
nmap <S-Left>   <C-w>h
nmap <S-Down>   <C-w>j
nmap <S-Up>     <C-w>k
nmap <S-Right>  <C-w>l

" highlight whitespace
:set list listchars=tab:»·,trail:·

" clear current search highlight
nnoremap <leader>/ :noh<cr>

" save file with sudo
cmap w!! %!sudo tee > /dev/null %

" ,T is taglist
nmap <silent> <leader>T :TlistToggle<CR>

" ,f is nerdtree
nmap <silent> <leader>f :NERDTreeToggle<CR>

" ack command
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" snippets dir
let g:snippets_dir="$VIMHOME/bundle/snipmate-snippets/snippets"

" maybe mappings
" nnoremap / /\v
" vnoremap / /\v
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>
" nnoremap j gj
" nnoremap k gk
" nnoremap <leader>ft Vatzf
