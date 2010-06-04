if has("autocmd")
	" Drupal *.module and *.install files.
	" there seems to be a problem with folding in .inc files...
  augroup module
  autocmd BufRead,BufNewFile *.module set filetype=php
  autocmd BufRead,BufNewFile *.install set filetype=php
  augroup END

  " :make is PHP lint
  autocmd FileType php set makeprg=php\ -l\ %
  autocmd FileType php set errorformat=%m\ in\ %f\ on\ line\ %l
endif

" the following are taken from 
" http://phpslacker.com/2009/02/05/vim-tips-for-php-programmers/

" highlights interpolated variables in sql strings and does sql-syntax highlighting.
autocmd FileType php let php_sql_query=1
" does exactly that. highlights html inside of php strings
autocmd FileType php let php_htmlInStrings=1
" automagically folds functions & methods
" autocmd FileType php let php_folding=1

