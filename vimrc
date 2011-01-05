" ~/.vimrc should only source this file.

filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" here
let $MYVIMRC=expand('<sfile>:p')
let $VIMHOME=expand('<sfile>:p:h')

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :split $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" basic editor config
syntax on
filetype plugin indent on
set nocompatible hidden number
set expandtab tabstop=2 shiftwidth=2
set autoindent smartindent
set autoread
set incsearch hlsearch showmatch
set ignorecase smartcase
set wildmode=list:longest
set scrolloff=2
set backspace=indent,eol,start whichwrap+=<,>,[,]
set nobackup noswapfile
set encoding=utf-8
set mouse=a
set mousemodel=popup_setpos

" gvim options
if has("gui_running")
  set guioptions-=T  "remove toolbar
  set guioptions-=m  "remove menubar
  set guioptions+=c
endif

" colours
set background=dark
if &t_Co >= 256 || has("gui_running")
  " colorscheme peaksea is very good too 
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
au FileType php,xhtml,xml so ~/.vim/bundle/html_autoclosetag/ftplugin/html_autoclosetag.vim

" format xml on load
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

" save when focus lost
au FocusLost ?* :w

" alt-arrow to navigate buffers
" (option-arrow on mac)
nmap <M-Left>   :bN<CR>
nmap <M-Right>  :bn<CR>
imap <M-Left>   <ESC>:bN<CR>
imap <M-Right>  <ESC>:bn<CR>

" shift-arrow to navigate windows
nmap <S-Left>   <C-w>h
imap <S-Left>   <Esc>Bi
nmap <S-Right>  <C-w>l
imap <S-Right>  <Esc>Ea
nmap <S-Down>   <C-w>j
imap <S-Down>   <ESC><C-w>ja
nmap <S-Up>     <C-w>k
imap <S-Up>     <ESC><C-w>ka

" The following two options interfere with one another.
"
" To display tabs and trailing space use :set list
" for word wrapping use :set nolist
nmap <silent> <leader>w :set list!<cr>

" word wrapping
set formatoptions=l
set lbr

" highlight whitespace
set listchars=tab:»·,trail:·

" save file with sudo
cmap w!! %!sudo tee > /dev/null %

" taglist
nmap <silent> <leader>T :TlistToggle<CR>

" nerdtree
nmap <silent> <leader>f :NERDTreeToggle<CR>

" gnome-open
nmap <silent> <leader>o :call g:Open_Word_Under_Cursor()<CR>
vmap <silent> <leader>o :call g:Open_Visual_Selection()<CR>

" fullscreen
imap <silent> <F11> <Esc>:!wmctrl -r :ACTIVE: -b toggle,fullscreen<CR>a
nmap <silent> <F11> :!wmctrl -r :ACTIVE: -b toggle,fullscreen<CR>
vmap <silent> <F11> :!wmctrl -r :ACTIVE: -b toggle,fullscreen<CR>

" spellcheck
nmap <silent> <leader>s :setlocal invspell<CR>

" ack command
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" snippets dir
let g:snippets_dir="$VIMHOME/bundle/snipmate-snippets/snippets"

" mac-specific stuff
if has("gui_macvim")
  set macmeta
  " should link this properly in the shell
  let Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8/bin/ctags'
endif

" syntastic setup
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
