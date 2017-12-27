execute pathogen#infect()

" syntastic
" =========
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 3

let g:syntastic_python_checkers = ['flake8']

" python-syntax
" =============
let python_highlight_all = 1
let python_highlight_builtins = 1
