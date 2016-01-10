"
" 設定ファイル分割
"
let s:HERE = expand('<sfile>:p:h')
let $VIMRC_DIR=s:HERE."/.vimrc.d"

if !isdirectory($VIMRC_DIR)
    call mkdir($VIMRC_DIR, "p")
endif

for f in split(glob($VIMRC_DIR . '/*.vim'), '\n')
    exe 'source' f
endfor
