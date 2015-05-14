# Vim Python Development Environment Setup

This script is designed for easily seting up the vim python development environment. The ideas of this script came from Sven Steinbauer's [post](http://unlogic.co.uk/2013/02/08/vim-as-a-python-ide/) and a powerful autocompletion tool called [YouCompleteMe](https://github.com/Valloric/YouCompleteMe).

## Dependencies

The installation of YouCompleteMe depends on the following libraries/packages: build-essential, cmake, python-dev, curl and git

To install those libraries in ubuntu, simply type
```bash

sudo apt-get install build-essential curl cmake python-dev git
```
Or in a redhat system
```bash

sudo yum install make automake gcc gcc-c++ kernel-devel cmake python-devel curl git
```
And then to make sure your have a vim with a version number greater than 7.3, and with python supported.

## Run the script

simply type the folowing command in a terminal
```bash

./vimsetup.sh [options]
```

Options are:
  
  -c  Compile YCM with llvm, this option currently only supports ubuntu 14.04
