"
" ステータスライン系
"

" 入力中のコマンドを表示
set showcmd

" ステータスラインを常に表示
set laststatus=2
" ステータスラインに文字コードと改行文字を表示する
set statusline=%<%f\ %r%h%w%=%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%y[%3l,%3c][%3p%%]%m

set ruler
