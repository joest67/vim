#!/usr/bin/env bash

# backup
echo "Backing up old vim configs"
today=`date +%Y%m%d`
for i in $HOME/.vim $HOME/.vimrc; do [ -e $i ] && mv $i $i.$today; done

# clone vim
echo "Cloning vim"
/usr/bin/env git clone git://github.com/joest67/vim.git $HOME/.vim
ln -s $HOME/.vim/vimrc $HOME/.vimrc

# install
cd $HOME/.vim && make install || echo "Installation ERROR!"
