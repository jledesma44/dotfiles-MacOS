#!/usr/bin/env zsh

#TODO - Keep an eye out for a different --no-quarantine solution.
#Currently you can't do the 'brew bundle --no-quarantine' option.
#It's currently exported in zshrc:
#export HOMEBREW_CASK_OPTS=--no-quarantine
#https://github/Homebrew/homebrew-bundle/issues/474


echo "\n<<< Starting Homebrew Setup >>>\n"
# if exist brew; then
#   echo "brew exists, skipping install"
# else
#   echo "brew doesn't exist, continuing with install"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# fi


brew bundle --verbose

