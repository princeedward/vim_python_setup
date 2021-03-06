#!/bin/bash
# Author: Yunkai Cui
# License: LICENSE
# Description:
# This script is used to setup a python development environment in vim
# Run the script by:
# $: ./vimsetup.sh [options]
# options:
# -c  Compile with llvm to have c family language auto completion support

# Get vundle
mkdir -p ~/.vim/bundle/
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle/
# Added the lines to vimrc to support python integration
cat vimconf >> ~/.vimrc

# Install Powerline font
git clone https://github.com/powerline/fonts.git powerlinefont/
cd powerlinefont/
./install.sh
cd ..
rm -rf powerlinefont

# Install bundles
vim +PluginInstall +qall

# build YCM
mkdir ycm_build
if [ $# -eq 1 ] && [ "$1" = "-c" ]; then
  curl -SL http://llvm.org/releases/3.6.0/clang+llvm-3.6.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz | tar xJ
  cd ycm_build
  cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=../clang+llvm-3.6.0-x86_64-linux-gnu . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
else
  cd ycm_build
  # with no c language semantic support
  cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
fi
make ycm_support_libs
cd ..
rm -r ycm_build

exit 0
