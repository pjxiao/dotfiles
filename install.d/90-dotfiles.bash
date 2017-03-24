# Download dotfiles
[ -d "$HOME/dotfiles" ] || \
    git clone https://github.com/pjxiao/dotfiles "$HOME/dotfiles"

# Configure dotfiles
echo '. ~/dotfiles/.bashrc' | \
    append_marker_leaded_lines '# Load dotfiles' "${HOME}/.bashrc"
echo 'exe "source" $HOME . "/dotfiles/.vimrc"' | \
    append_marker_leaded_lines '" Load dotfiles' "${HOME}/.vimrc"

ln -s ${HOME}/dotfiles/.inputrc ${HOME}/.inputrc || true
