"
" バックアップとスワップの設定 (Vim7 or later)
"

if v:version >= 700 && !has('win32')
    let $VIM_DATA_DIR=$HOME."/.vim.local"
    if !isdirectory($VIM_DATA_DIR)
        call mkdir($VIM_DATA_DIR, "p")
    endif

    " バックアップディレクトリ
    set backup
    set backupdir=$VIM_DATA_DIR/backup
    au BufWritePre * let &bex = '.' . strftime("%Y%m%d%H") . '~'
    if !isdirectory(&backupdir)
        call mkdir(&backupdir, "p")
    endif

    " スワップディレクトリ
    set swapfile
    set directory=$VIM_DATA_DIR/swap
    set updatecount=200
    if !isdirectory(&directory)
        call mkdir(&directory, "p")
    endif
endif

