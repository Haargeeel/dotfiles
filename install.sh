#!/bin/bash

green='\033[0;32m'
blue='\033[0;34m'
NC='\033[0m'

#CP == current path
CP=`pwd -P`

echo "check if .vimrc is a link"
if [ -L "$HOME/.vimrc" ];then
  echo -e "${green}already a link. Nothing to do here.${NC}"
else
  echo -e "${blue}not a link. Deleting file and creating link.${NC}"
  rm $HOME/.vimrc
  ln -s $CP/.vimrc $HOME/.vimrc
fi

echo "check if .bash_profile is a link"
if [ -L "$HOME/.bash_profile" ];then
  echo -e "${green}already a link. Nothing to do here.${NC}"
else
  echo -e "${blue}not a link. Deleting file and creating link.${NC}"
  rm $HOME/.bash_profile
  ln -s $CP/.bash_profile $HOME/.bash_profile
fi

echo "check if .inputrc is a link"
if [ -L "$HOME/.inputrc" ];then
  echo -e "${green}already a link. Nothing to do here.${NC}"
else
  echo -e "${blue}not a link. Deleting file and creating link.${NC}"
  rm $HOME/.inputrc
  ln -s $CP/.inputrc $HOME/.inputrc
fi

echo -e "${green}done with all the link${NC}"
echo "check the vim bundles now"

echo "check if there is any .vim directory"
if [ ! -d "$HOME/.vim" ]; then
  echo -e "${blue}no directory found. Better create one${NC}"
  cp -r $CP/.vim $HOME/
else
  echo -e "${green}found one. Continue working here.${NC}"
fi

DIR="${HOME}/.vim/bundle/"
cd ~/.vim/bundle

echo "check all the git bundles"

if [ ! -d ${DIR}"ctrlp.vim/" ]; then
  echo "install control-p"
  git clone git@github.com:kien/ctrlp.vim.git
fi

if [ ! -d ${DIR}"nerdcommenter/" ]; then
  echo "install nerdcommenter"
  git clone git@github.com:scrooloose/nerdcommenter.git
fi

if [ ! -d ${DIR}"nerdtree/" ]; then
  echo "install nerdtree"
  git clone git@github.com:scrooloose/nerdtree.git
fi

if [ ! -d ${DIR}"supertab/" ]; then
  echo "install supertab"
  git clone git@github.com:ervandew/supertab.git
fi

if [ ! -d ${DIR}"vim-colors-solarized/" ]; then
  echo "install solarized colors"
  git clone git@github.com:altercation/vim-colors-solarized.git
fi

if [ ! -d ${DIR}"vim-fugitive/" ]; then
  echo "install fugitive"
  git clone git@github.com:tpope/vim-fugitive.git
fi

if [ ! -d ${DIR}"vim-jade/" ]; then
  echo "install jade"
  git clone git@github.com:digitaltoad/vim-jade.git
fi

if [ ! -d ${DIR}"vim-powerline/" ]; then
  echo "install powerline"
  git clone git@github.com:Lokaltog/vim-powerline.git
fi

if [ ! -d ${DIR}"vim-sparkup/" ]; then
  echo "install sparkup"
  git clone git@github.com:rstacruz/sparkup.git
fi

if [ ! -d ${DIR}"vim-stylus/" ]; then
  echo "install stylus"
  git clone git@github.com:wavded/vim-stylus.git
fi

if [ ! -d ${DIR}"LaTeX-Box/" ]; then
  echo "install latex box"
  git clone git@github.com:LaTeX-Box-Team/LaTeX-Box.git
fi

echo -e "${green}all done${NC}"
