#!/usr/bin/env zsh

source ~/.zshrc

development-kit install zsh
mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
source ~/.zshrc

development-kit install java
source ~/.zshrc

development-kit install android
source ~/.zshrc

development-kit install flutter
source ~/.zshrc
exit 0