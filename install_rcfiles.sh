#!bin/bash

rm ~/.config/nvim/init.vim
rm ~/.bash_aliases
rm ~/.tmux.conf

ln -s ~/rcfile/init.vim ~/.config/nvim/init.vim
ln -s ~/rcfile/.bash_aliases ~/.bash_aliases
ln -s ~/rcfile/.tmux.conf ~/.tmux.conf
