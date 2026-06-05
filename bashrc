# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
#source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
# Aliases (app configs) ====================================================================

alias bashconfig="nvims ~/.bashrc"
alias ohmyzsh="nvims ~/.oh-my-zsh"
alias tmuxconfig="nvims ~/.tmux.conf"
alias kittyconfig="nvims ~/.config/kitty/kitty.conf"
alias kittycolors="kitten themes"
alias sshconfig="nvims ~/.ssh/config"
alias reloadbash="source ~/.bashrc"
alias nvimconfig="nvims .config/nvim"
alias gitconfig="nvims ~/.gitconfig"

# Aliases (quick cd/ directories) ================================

alias development="cd ~/Development/"
alias downloads="cd ~/Downloads/"
alias sites="cd ~/Development/1.WebDev/10.Sites/"
alias challenges="cd ~/Development/1.WebDev/1.Challenges"
alias tutorials="cd ~/Development/1.WebDev/2.Tutorials"
alias shopifydev="cd ~/Development/1.WebDev/10.Sites/4.Shopify-development/"
alias dot="cd ~/.dotfiles/"
alias tmx="tmux new -A -s General-Shell"
alias mcc="EDITOR=lvim mc"
alias cat="bat"
alias man="batman"

# Aliases (file management) ============================

alias la="ls -laFh"
alias la="ls -lAFh"
alias eza="eza -lA --git"
alias ls="eza -lAh"
alias lsg="eza -lAhG --git"
alias ll="eza --git --tree --level=2"
alias root="sudo su"
alias lg="lazygit"

# Aliases (server start up) ============================

alias l-server="live-server --port=5500 --host=0.0.0.0 --browser='firefox developer edition' ."
alias p-server="python3 -m http.server 8080 --b 0.0.0.0"
alias a-server="pnpm astro dev --host 0.0.0.0"
alias b-server="browser-sync start --server --host 0.0.0.0 --port 8001 --watch --browser 'firefox developer edition'"
alias h-server="hugo server --baseURL=http://100.65.17.20:1313 --bind=0.0.0.0 --noHTTPCache"

# Aliases (Git) =========================================

alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gd='git diff'
alias gcl="git clone"
alias gc="git commit -m"
alias gl="git log"
alias gi="git init"
alias gp="git push"
alias gu="git pull"

# Prompt settings==========================================================

# Helper function to extract current git branch
parse_git_branch() {
  git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Prompt showing User, Directory, and Git branch in Purple
export PS1='\[\e[1;32m\]\u\[\e[m\]:\[\e[1;34m\]\W\[\e[1;35m\]$(parse_git_branch)\[\e[m\] \$ '

# PROMPT='
# %{$fg_bold[blue]%}$USER@%{$fg[green]%}%m%}%{$fg_bold[cyan]%} %c $(git_prompt_info)%{$reset_color%} %L %# '
#
# RPROMPT='%*'

# Add locations to $PATH Variables=========================================

export PATH=$HOME/bin:$PATH

# Functions ===============================================================

function mkcd() {
  mkdir -p "$@" && cd "$_"
}

# fastfetch================================================================

fastfetch

figlet Devstack44

# Set up fzf keybindings and fuzzy completions
eval "$(fzf --bash)"

export EDITOR=vim
