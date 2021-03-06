#!/usr/bin/env bash

set -euo pipefail

DOTFILES=$(pwd)/data

# git
ln -sf ${DOTFILES}/gitconfig ${HOME}/.gitconfig
ln -sf ${DOTFILES}/gitignore ${HOME}/.gitignore
curl -o ${HOME}/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh


# vim
ln -sf  ${DOTFILES}/vimrc ${HOME}/.vimrc

# term multiplexers
mkdir -p ${HOME}/.screen ${HOME}/.tmux
ln -sf ${DOTFILES}/screenrc ${HOME}/.screenrc
ln -sf ${DOTFILES}/tmux.conf ${HOME}/.tmux.conf
# hopefully not needed anymore
#ln -sf  ${DOTFILES}/termcaprc ${HOME}/.termcaprc

# shells
ln -sf ${DOTFILES}/bashrc ${HOME}/.bashrc
ln -sf ${DOTFILES}/bash_profile ${HOME}/.bash_profile
ln -sf ${DOTFILES}/profile ${HOME}/.profile
ln -sf ${DOTFILES}/relocate-ssh ${HOME}/.relocate-ssh.bash

mkdir -p ${HOME}/.config/fish
ln -sf ${DOTFILES}/fish/config ${HOME}/.config/fish/config.fish
ln -snfF ${DOTFILES}/fish/functions ${HOME}/.config/fish/functions
curl -fLo - https://raw.githubusercontent.com/fish-shell/fish-shell/master/share/functions/__fish_git_prompt.fish | sed 's/set -a/set/g' > ${HOME}/.config/fish/functions/__fish_git_prompt.fish

mkdir -p ${HOME}/.config/nvim
ln -sf ${DOTFILES}/init.nvim ${HOME}/.config/nvim/init.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

. update-z.sh
