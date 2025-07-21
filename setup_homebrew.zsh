#!/bin/zsh

#TODO - Keep an eye out for a different --no-quarantine solution.
#Currently you can't do the 'brew bundle --no-quarantine' option.
#It's currently exported in zshrc:
#export HOMEBREW_CASK_OPTS=--no-quarantine
#https://github/Homebrew/homebrew-bundle/issues/474


# echo "\n<<< Starting Homebrew Setup >>>\n"
# if exists brew; then
#   echo "brew exists, skipping install"
# else
#   echo "brew doesn't exist, continuing with install"
#   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# fi


# Add Homebrew to PATH regardless of architecture
if [[ -d "/opt/homebrew/bin" ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
elif [[ -d "/usr/local/bin" ]]; then
    export PATH="/usr/local/bin:$PATH"
fi

# Now check for Homebrew
if command -v brew >/dev/null 2>&1; then
    echo "***** Homebrew is already installed *******"
    echo "***** Now checking brewfile for installs and/or updates!!! ******"
else
    echo "Installing Homebrew..."
    # Your installation code
fi

brew bundle --verbose

