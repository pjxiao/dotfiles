" コンパチブルモードを切る
set nocompatible

" カラースキーマ
let g:solarized_termcolors = 256
set background=dark
" colorscheme solarized


" 行表示
set number
set ruler

" インデントの設定
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab

" 括弧入力時に対応する括弧を表示
set showmatch
" 対応するアレを表示する
set showmatch

" 折り返す
set wrap
" 自動改行を切る
set textwidth=0

" インクリメンタルサーチ!!
set incsearch
" 検索文字列が小文字の場合は大文字小文字を区別しない
set ignorecase
" 検索文字列に大文字が含まれていたら区別する
set smartcase
" 最後まで検索したら戻る
set wrapscan
" 検索文字列のハイライトを有効にする
set hlsearch

" インデントを表示
set lcs=tab:>\ ,trail:_,extends:\
set list

" マウスを有効化
set mouse=

" 折りたたみを有効化
set foldmethod=marker

" シンタックスハイライトを有効にする
if has("syntax")
    syntax on
endif

" 履歴をたくさん残す
set history=10000

" 補完方法
set wildmode=longest,list

" Turnon omni complete
set omnifunc=syntaxcomplete#Complete
