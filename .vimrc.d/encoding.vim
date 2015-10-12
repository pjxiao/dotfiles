"
" エンコーディング
"
if $LANG == "ja_JP.SJIS"
    set enc=cp932
else
    set enc=utf-8
endif
set fileencodings=utf-8,cp932,euc-jp,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213
