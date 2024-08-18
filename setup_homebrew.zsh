#!/usr/bin/env zsh

if exist brew; then
  echo "brew exists, skipping install"
else
  echo "brew doesn't exist, continuing with install"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "\n<<< Starting Homebrew Setup >>>\n"



brew bundle --verbose

