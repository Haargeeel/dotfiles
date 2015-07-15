#!/bin/bash

green='\033[0;32m'
red='\033[0;31m'
NC='\033[0m'

PATH=`pwd -P`
echo $PATH

echo "check if .vimrc is a link"
if [[ -L "$HOME/.vimrc" ]];then
  echo -e "${green}already a link. Nothing to do here.${NC}"
else
  echo -e "${red}not a link. Deleting file and creating link.${NC}"
  echo "`rm $HOME/.vimrc`"
  echo "`ln -s $PATH/.vimrc $HOME/.vimrc`"
fi

echo "check if .bash_profile is a link"
if [[ -L "$HOME/.bash_profile" ]];then
  echo -e "${green}already a link. Nothing to do here.${NC}"
else
  echo -e "${red}not a link. Deleting file and creating link.${NC}"
  echo "`rm $HOME/.bash_profile`"
  echo "`ln -s $PATH/.bash_profile $HOME/.bash_profile`"
fi

echo "check if .inputrc is a link"
if [[ -L "$HOME/.inputrc" ]];then
  echo -e "${green}already a link. Nothing to do here.${NC}"
else
  echo -e "${red}not a link. Deleting file and creating link.${NC}"
  echo "`rm $HOME/.inputrc`"
  echo "`ln -s $PATH/.inputrc $HOME/.inputrc`"
fi

echo -e "${green}done with all the link${NC}"
echo "check the vim bundles now"

#/bin/sh $PATH/bundles.sh
