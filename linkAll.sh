#!/bin/bash

mkdir ~/.dotbackup
echo Linking bash
mv ~/.bashrc ~/.dotbackup/bashrc
mv ~/.bash_logout ~/.dotbackup/bash_logout
mv ~/.bash_profile ~/.dotbackup/bash_profile
mv ~/.util ~/.dotbackup/util
ln -s ~/.dotfiles/bash/bashrc ~/.bashrc
ln -s ~/.dotfiles/bash/bash_logout ~/.bash_logout
ln -s ~/.dotfiles/bash/bash_profile ~/.bash_profile
ln -s ~/.dotfiles/bash/util ~/.util

echo Linking tmux
mv ~/.tmux ~/.dotbackup/tmux
mv ~/.tmux.conf ~/.dotbackup/tmux.conf
ln -s ~/.dotfiles/tmux ~/.tmux
ln -s ~/.tmux/tmux.conf ~/.tmux.conf
if [ ! -f ~/.todo ]
then
    cp ~/.tmux/resources/todo-header ~/.todo
fi

echo Linking vim/neovim
mv ~/.vim ~/.dotbackup/vim
mv ~/.vimrc ~/.dotbackup/vimrc
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
if [ ! -d ~/.config ]
then
    mkdir ~/.config
fi
if [ ! -d ~/.config/nvim ]
then
    mkdir ~/.config/nvim
fi
ln -s ~/.dotfiles/vim/nvim/init.vim ~/.config/nvim/init.vim


echo Linking git
mv ~/.git-prompt.sh ~/.dotbackup/git-prompt.sh
mv ~/.gitconfig ~/.dotbackup/gitconfig
mv ~/.gitignore_global ~/.dotbackup/gitignore_global
ln -s ~/.dotfiles/git/git-prompt.sh ~/.git-prompt.sh
ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/git/gitignore_global ~/.gitignore_global

echo Set Git Values
git config --global core.excludesfile ~/.gitignore_global

# Git completion
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
