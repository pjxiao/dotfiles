"
" Coffeescript
"
" vimにcoffeeファイルタイプを認識させる
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
" " インデントを設定
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et


"
" Markdown
"
au BufRead,BufNewFile,BufReadPre *.md   set filetype=markdown ai formatoptions=tcroqn2 comments=n:>
au! BufRead,BufNewFile,BufReadPre *.md   set ai formatoptions=tcroqn2 comments=n:>
