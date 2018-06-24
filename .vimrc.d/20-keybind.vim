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

" ハイライトを解除
nmap <ESC><ESC> :nohlsearch<CR>:set nopaste<CR><ESC>

" 検索時にジャンプさせない
" cf. https://stackoverflow.com/a/4257175
nnoremap * *``
nnoremap # #``
