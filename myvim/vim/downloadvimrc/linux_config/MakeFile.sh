#!/bin/bash
cd .

CF_DIR=`pwd`

#更新配置的子模块到最新版本
git submodule init
git submodule update
git submodule -q foreach git pull -q origin master

#.bash_profile
ln -s $CF_DIR/aliases/bash_profile ~/.bash_profile

# jump tool
ln -s $CF_DIR/aliases/markrc ~/.markrc

#alias
ALIASES_DIR="$CF_DIR/aliases"
ALIASES_FILES=`ls $ALIASES_DIR/*aliases`
for f in $ALIASES_FILES
do
    F_NAME=`basename $f`
    ln -s $f ~/"."$F_NAME
done

#dir_colors
#ln -s dircolors.256dark ~/.dir_colors
ln -s $CF_DIR/dircolors-solarized/dircolors.256dark .dir_colors

#completion
COMPLETION_DIR="$CF_DIR/completions"
ALIASES_FILES=`ls $COMPLETION_DIR/*completion`
for f in $ALIASES_FILES
do
    F_NAME=`basename $f`
    ln -s $f ~/"."$F_NAME
done

#自动安装配置vim
sh -x $CF_DIR/k-vim/install.sh

#bin
ln -s $CF_DIR/bin ~/bin

if [ ! -d ~/tmp ]
then
    mkdir ~/tmp
fi

#vim bk and undo dir
if [ ! -d ~/bak/vimbk ]
then
    mkdir -p ~/bak/vimbk
fi

if [ ! -d ~/bak/vimundo ]
then
    mkdir -p ~/bak/vimundo
fi

#configs
  #for ssh
if [ -d ~/.ssh ]
then
    mkdir -p ~/.ssh
fi
ln -s $CF_DIR/config/ssh-config ~/.ssh/config

#for tmux
#ln -s $CF_DIR/config/tmux-config ~/.tmux.conf
ln -s $CF_DIR/config/tmux.conf ~/.tmux.conf

#for git
ln -s $CF_DIR/config/git-config ~/.gitconfig
