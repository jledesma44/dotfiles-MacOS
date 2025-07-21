#!/bin/zsh

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Checking for Oh My Zsh installation...${NC}"

# Check if Oh My Zsh is installed by looking for the .oh-my-zsh directory
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo -e "${GREEN}✓ Oh My Zsh is already installed. Skipping installation.${NC}"
    
    # Show version info if available
    if [ -f "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]; then
        version=$(grep "# Version:" "$HOME/.oh-my-zsh/oh-my-zsh.sh" 2>/dev/null | head -1 | cut -d':' -f2 | xargs)
        if [ -n "$version" ]; then
            echo -e "${BLUE}Installed version: $version${NC}"
        fi
    fi
else
    echo -e "${YELLOW}Oh My Zsh not found. Installing...${NC}"
    
    # Check if curl is available
    if ! command -v curl &> /dev/null; then
        echo "Error: curl is required but not installed. Please install curl first."
        exit 1
    fi
    
    # Install Oh My Zsh using the official installation script
    echo "Downloading and running Oh My Zsh installer..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    
    # Check if installation was successful
    if [ -d "$HOME/.oh-my-zsh" ]; then
        echo -e "${GREEN}✓ Oh My Zsh has been successfully installed!${NC}"
    else
        echo -e "${RED}✗ Installation failed. Please check the error messages above.${NC}"
        exit 1
    fi
fi

echo -e "${BLUE}Done!${NC}"
