" ~/.vimrc should only source this file.

" here
let $MYVIMRC=expand('<sfile>:p')
let $VIMHOME=expand('<sfile>:p:h')

" pathogen plugins
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" quickly edit/reload the vimrc file
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
set display=lastline

" gui options
if has("gui_running")
  set background=light
  set guioptions-=T  " remove toolbar
  set guioptions-=m  " remove menubar
  set guioptions+=c  " console dialogs not popups
endif

" colours
let g:solarized_visibility="low"    "default value is normal
colorscheme solarized

" ctags: look for tags file in current directory, or recurse up
set tags=tags;/

" xml tag autoclose
au FileType php,xhtml,xml so ~/.vim/bundle/html_autoclosetag/ftplugin/html_autoclosetag.vim

" format xml on load
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

" save when focus lost
au FocusLost * silent! w

" alt-arrow to navigate buffers
" (option-arrow on mac)
" @FIXME: doesn't work
"nmap <M-Left>   :bN<CR>
"nmap <M-Right>  :bn<CR>
"imap <M-Left>   <ESC>:bN<CR>
"imap <M-Right>  <ESC>:bn<CR>

" shift-arrow to navigate windows
nmap <S-Left>   <C-w>h
imap <S-Left>   <Esc>Bi
nmap <S-Right>  <C-w>l
imap <S-Right>  <Esc>Ea
nmap <S-Down>   <C-w>j
imap <S-Down>   <ESC><C-w>ja
nmap <S-Up>     <C-w>k
imap <S-Up>     <ESC><C-w>ka

" yankring UI
nmap <silent> <leader>y :YRShow<CR>

" The following two options interfere with one another.
"
" To display tabs and trailing space use :set list
" for word wrapping use :set nolist
nmap <silent> <leader>w :set list!<cr>

" word wrapping
set lbr formatoptions=l

" highlight whitespace
set list listchars=tab:»·,trail:·

" save file with sudo
cmap w!! %!sudo tee > /dev/null %

" tagbar
let g:tagbar_ctags_bin="/usr/local/bin/ctags" " brew ctags, not the default mac one
nmap <silent> <leader>T :TagbarToggle<CR>

" nerdtree
nmap <silent> <leader>f :NERDTreeToggle<CR>

" gnome-open
nmap <silent> <leader>o :call g:Open_Word_Under_Cursor()<CR>
vmap <silent> <leader>o :call g:Open_Visual_Selection()<CR>

" fullscreen
" only works where wmctrl is present (i.e. not mac)
imap <silent> <F11> <Esc>:!wmctrl -r :ACTIVE: -b toggle,fullscreen<CR>a
nmap <silent> <F11> :!wmctrl -r :ACTIVE: -b toggle,fullscreen<CR>
vmap <silent> <F11> :!wmctrl -r :ACTIVE: -b toggle,fullscreen<CR>

" spellcheck
nmap <silent> <leader>s :setlocal invspell<CR>

" ack command
let g:ackprg="ack -H --nocolor --nogroup --column"

" mac-specific stuff
if has("gui_macvim")
  set macmeta
  set guifont=Menlo\ Regular:h13
endif

" syntastic setup
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

" drupal stuff
if has("autocmd")
  autocmd BufRead,BufNewFile *.module set filetype=php
  autocmd BufRead,BufNewFile *.install set filetype=php
endif
