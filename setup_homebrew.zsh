#!/bin/zsh

#TODO - Keep an eye out for a different --no-quarantine solution.
#Currently you can't do the 'brew bundle --no-quarantine' option.
#It's currently exported in zshrc:
#export HOMEBREW_CASK_OPTS=--no-quarantine
#https://github/Homebrew/homebrew-bundle/issues/474

# Add Homebrew to PATH regardless of architecture

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo "######################################################################################"
echo "#        ${YELLOW} !! 🍺 HOMEBREW INSTALLATION / UPDATES !!${NC}                     #"
echo "######################################################################################"


if [[ -d "/opt/homebrew/bin" ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
elif [[ -d "/usr/local/bin" ]]; then
    export PATH="/usr/local/bin:$PATH"
fi

# Now check for Homebrew
if command -v brew >/dev/null 2>&1; then
    echo "${GREEN}***** Homebrew is already installed *******${NC}"
    echo "${BLUE}***** Now checking brewfile for installs and/or updates!!! ******${NC}"
else
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # After installation, source Homebrew's environment
    if [[ -f "/opt/homebrew/bin/brew" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -f "/usr/local/bin/brew" ]]; then
        eval "$(/usr/local/bin/brew shellenv)"
    fi
    
    # Verify brew is now available
    if ! command -v brew >/dev/null 2>&1; then
        echo "Error: Homebrew installation failed or brew command not found"
        exit 1
    fi
    
    echo "***** Homebrew installed successfully! *****"
fi

brew bundle --verbose
