"
" 設定ファイル分割
"
let $VIMRC_DIR=$HOME."/.vimrc.d"
if !isdirectory($VIMRC_DIR)
    call mkdir($VIMRC_DIR, "p")
endif

for f in split(glob('~/.vimrc.d/*.vim'), '\n')
    exe 'source' f
endfor
