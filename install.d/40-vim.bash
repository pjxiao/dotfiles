_bundle_dir="${HOME}/.vim/bundle"

for d in "${HOME}/.vim/autoload" "${_bundle_dir}"
do
    test -d "${d}" || mkdir -p "${d}"
done

# Install pathogen
# FIXME: this may be avable to replace with generating a script add rtps
test -f "${HOME}/.vim/autoload/pathogen.vim" || \
    curl -LSso \
        "${HOME}/.vim/autoload/pathogen.vim" \
        https://tpo.pe/pathogen.vim


# added at 2017-11-03
test -d ${_bundle_dir}/syntastic || \
    git clone \
        --depth=1 \
        https://github.com/vim-syntastic/syntastic.git \
        ${_bundle_dir}/syntastic


# added at 2017-11-03
# TODO: try YouCompleteMe (https://code.djangoproject.com/wiki/UsingVimWithDjango#YouCompleteMe)
test -d ${_bundle_dir}/jedi-vim || \
    git clone \
        --depth=1 \
        --recursive \
        https://github.com/nakamuray/jedi-vim \
        ${_bundle_dir}/jedi-vim


# added at 2017-11-03
test -d ${_bundle_dir}/jedi-rpc.vim || \
    git clone \
        --depth=1 \
        --recursive \
        https://github.com/nakamuray/jedi-rpc.vim \
        ${_bundle_dir}/jedi-rpc.vim


# added at 2017-11-03
test -d ${_bundle_dir}/vim-virtualenv || \
    git clone \
        --depth=1 \
        https://github.com/jmcantrell/vim-virtualenv \
        ${_bundle_dir}/vim-virtualenv


# added at 2017-11-03
test -d ${_bundle_dir}/python-syntax || \
    git clone \
        --depth=1 \
        https://github.com/hdima/python-syntax \
        ${_bundle_dir}/python-syntax


# added at 2017-11-03
test -d ${_bundle_dir}/vim-python-pep8-indent || \
    git clone \
        --depth=1 \
        https://github.com/hynek/vim-python-pep8-indent \
        ${_bundle_dir}/vim-python-pep8-indent


# added at 2018-06-24
test -d ${_bundle_dir}/camelcasemotion || \
    git clone \
        --depth=1 \
        https://github.com/vim-scripts/camelcasemotion \
        ${_bundle_dir}/camelcasemotion

# added at 2019-01-15
test -d ${_bundle_dir}/indentLine || \
    git clone \
        --depth=1 \
        https://github.com/Yggdroot/indentLine.git \
        ${_bundle_dir}/indentLine


unset _bundle_dir
