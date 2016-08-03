" Install {{{
"
let $BUNDLE_DIR=$HOME."/.vim/bundle/"
let $NEOBUNDLE_PATH=$BUNDLE_DIR."neobundle.vim"
if !isdirectory($BUNDLE_DIR)
    call mkdir($BUNDLE_DIR, "p")
endif

if !isdirectory($NEOBUNDLE_PATH)
    execute "!git clone https://github.com/Shougo/neobundle.vim ".$NEOBUNDLE_PATH
endif
" }}}

" SetUp {{{
"

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
" }}}


" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

" CoffeeScript {{{
NeoBundle 'kchmck/vim-coffee-script'
" }}}
" Neocomplete {{{
NeoBundle 'Shougo/neocomplete'
" }}}
" Neosnippet {{{
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
" }}}
" Jedi {{{
let python_major_version = system("python -c 'import sys; print(sys.version_info[0])'")
if python_major_version == 2 && has('python')
    python None
elseif python_major_version == 3 && has('python3')
    python3 None
endif
NeoBundle 'jmcantrell/vim-virtualenv'
" NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'nakamuray/jedi-vim'

" }}}
" Django {{{
NeoBundle 'lambdalisue/vim-django-support'
NeoBundle 'mjbrownie/vim-htmldjango_omnicomplete'
let g:htmldjangocomplete_html_flavour = 'html401s'
au FileType htmldjango set omnifunc=htmldjangocomplete#CompleteDjango
" }}}
" vimproc  {{{
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
" }}}
" vimshell  {{{
NeoBundle 'Shougo/vimshell.vim'
" }}}
" quickrun  {{{
NeoBundle 'thinca/vim-quickrun'
let g:quickrun_config = {
\   "_" : {
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 60,
\       'outputter'                 : 'multi:buffer',
\       'outputter/buffer/split'    : ''
\   },
\}
" }}}
" Markdown  {{{
NeoBundle 'plasticboy/vim-markdown'
let g:vim_markdown_initial_foldlevel=1024
" }}}
" vim-less  {{{
NeoBundle 'groenewege/vim-less'
" }}}
" Flake8  {{{
NeoBundle 'Flake8-vim'
" }}}
" Python {{{
NeoBundle 'hdima/python-syntax'
let python_highlight_all = 1
let python_highlight_builtins = 1
NeoBundle "hynek/vim-python-pep8-indent"
" }}}
" colorscheme  {{{
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'twilight'
" }}}
" SQL  {{{
" NeoBundle 'sql.vim'
" NeoBundle 'sqlcomplete.vim'
" }}}
" reST {{{
NeoBundle 'pjxiao/riv.vim'
" }}}

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
