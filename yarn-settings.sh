#!/bin/sh
# Script to configure yarn source and PATH environment variable for both zsh and fish shell

# Check if zsh is installed
if [ -n "$(command -v zsh)" ]; then
  # Add yarn global path to zshrc
  echo 'export PATH="$PATH:$HOME/.yarn/bin"' >> ~/.zshrc

  # Set yarn registry to Taobao
  yarn config set registry https://registry.npm.taobao.org -g
fi

# Check if fish is installed
if [ -n "$(command -v fish)" ]; then
  # Add yarn global path to fish config
  echo 'set -x PATH $PATH ~/.yarn/bin' >> ~/.config/fish/config.fish

  # Set yarn registry to Taobao
  yarn config set registry https://registry.npm.taobao.org -g
fi
