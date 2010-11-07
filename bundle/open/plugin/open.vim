" default value for g:openprg
let g:openprg="gnome-open"
" this probably doesn't work
if has("mac_unix")
  let g:openprg="open"
endif

function! g:Open_Word_Under_Cursor()
  call system(g:openprg ." ". expand('<cWORD>'))
endfunction

function! g:Open_Visual_Selection()
  call system(g:openprg ." ". @*)
endfunction

