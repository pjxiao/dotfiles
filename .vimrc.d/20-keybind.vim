"
" キーバインド
"

" カーソルを常に中央に表示 -> 使いにくいからやめ
" set scrolloff=999

" バッファ移動を <C-N> / <C-P> で行う
nnoremap <C-N> :next <CR>
nnoremap <C-P> :previous <CR>

" タブ移動
nnoremap <C-L> :redraw!<CR>:tabn<CR>
nnoremap <C-H> :tabp <CR>

map <C-g> :Gtags 

nmap <ESC><ESC> :nohlsearch<CR>:set nopaste<CR><ESC>
