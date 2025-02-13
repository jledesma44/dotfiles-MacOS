#!/usr/bin/env zsh

echo "\n<<< Starting Homebrew Setup >>>\n"
# if exist brew; then
#   echo "brew exists, skipping install"
# else
#   echo "brew doesn't exist, continuing with install"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# fi
brew install httpie
brew install bat

brew install --cask visual-studio-code




# brew bundle --verbose

