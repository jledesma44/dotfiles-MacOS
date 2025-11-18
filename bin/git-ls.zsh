#!/bin/zsh

# Colors for better readability
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Run the ls command with eza and your preferred flags
eza -lAh "$@"

# Check if current directory is a git repository
if git rev-parse --is-inside-work-tree &>/dev/null; then
    echo ""
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BLUE}📦 Git Repository Detected${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    
    # Check if there are any changes
    if [[ -n $(git status --porcelain) ]]; then
        echo -e "${YELLOW}⚠️  Changes detected in repository:${NC}"
        echo ""
        git status --short
        echo ""
        
        # Ask user if they want to add changes
        echo -en "${GREEN}Would you like to stage these changes? (y/n): ${NC}"
        read -r REPLY
        echo ""
        
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            # Check if lazygit is installed
            if command -v lazygit &>/dev/null; then
                echo -e "${BLUE}Opening lazygit...${NC}"
                lazygit
            else
                echo -e "${RED}✗ lazygit is not installed${NC}"
                echo -e "${YELLOW}Install it with: brew install lazygit (macOS) or check https://github.com/jesseduffield/lazygit${NC}"
            fi
        fi
    else
        echo -e "${GREEN}✓ No local changes detected${NC}"
        echo ""
        
        # Ask user if they want to pull
        echo -en "${CYAN}Would you like to pull from remote? (y/n): ${NC}"
        read -r REPLY
        echo ""
        
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            echo -e "${BLUE}Pulling from remote...${NC}"
            git pull
            
            if [ $? -eq 0 ]; then
                echo -e "${GREEN}✓ Successfully pulled from remote${NC}"
            else
                echo -e "${RED}✗ Error pulling from remote${NC}"
            fi
        fi
    fi
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
fi
