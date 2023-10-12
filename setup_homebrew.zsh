#!/usr/bin/env zsh

echo "\n<<< Starting Homebrew Setup >>>\n"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install httpie
brew install bat
brew install --no-quarantine visual-studio-code
brew install --no-quarantine alfred
brew install --no-quarantine firefox
brew tap homebrew/cask-versions
brew install --cask --no-quarantine firefox-developer-edition
