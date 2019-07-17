execute pathogen#infect()

" python-syntax
" =============
let python_highlight_all = 1
let python_highlight_builtins = 1

" camelcasemotion
" ===============
" cf. http://nanasi.jp/articles/vim/camelcasemotion_vim.html
:map <silent> w <Plug>CamelCaseMotion_w
:map <silent> b <Plug>CamelCaseMotion_b
:map <silent> e <Plug>CamelCaseMotion_e

" indentLine
" ==========
let g:indentLine_char = '|'

" ale
" ===
" cf. https://github.com/w0rp/ale
let g:ale_linters = {
\    'python': ['flake8'],
\}
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_open_list = 1
let g:ale_list_window_size = 3
