# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/jaimeledesma/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   xport EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Variables syntax highlighting for man pages =================================
export HOMEBREW_CASK_OPTS="--no-quarantine"

# Change ZSH Options =========================================================


# Aliases (app configs) ====================================================================

alias zshconfig="nvims ~/.zshrc"
alias ohmyzsh="nvims ~/.oh-my-zsh"
alias tmuxconfig="nvims ~/.tmux.conf"
alias kittyconfig="nvims ~/.config/kitty/kitty.conf"
alias kittycolors="kitten themes"
alias sshconfig="nvims ~/.ssh/config"
alias reloadzsh="source ~/.zshrc"
alias nvimconfig="nvims .config/nvim"
alias gitconfig="nvims ~/.gitconfig"


# Aliases (quick cd/ directories) ================================

alias development="cd ~/Development/1.WebDev"
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
alias ls="eza -lAh --git && git status && git pull"
alias lsg="eza -lAhG --git"
alias ll="eza --git --tree --level=2"
alias root="sudo su"

# Aliases (server start up) ============================

alias l-server="live-server --port=5500 --host=0.0.0.0 --browser='firefox developer edition' ."
alias p-server="python3 -m http.server 8080 --b 0.0.0.0"
alias a-server="pnpm astro dev --host 0.0.0.0"
alias b-server="browser-sync start --server --host 0.0.0.0 --port 8001 --watch --browser 'firefox developer edition'"

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


#Alias for brew bundle =================================

alias bbd="brew bundle dump --force --describe"

#Obsidian Vault-------------
alias oo="$HOME/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Devstack44"


# Neovim Distribution switcher ===============================================

alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-devstack44="NVIM_APPNAME=Devstack44nvim nvim"
alias nvim-chad="NVIM_APPNAME=NvChad nvim"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"

function nvims() {
  items=("Lazyvim" "Devstack44nvim" "default" "NvChad" "AstroNvim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

bindkey -s ^n "nvims\n"

alias vim="nvims"
alias nvim="nvims"


# Prompt settings========================================================== 

PROMPT='
%{$fg_bold[blue]%}$USER@%{$fg[green]%}%m%}%{$fg_bold[cyan]%} %c $(git_prompt_info)%{$reset_color%} %L %# '

RPROMPT='%*'



# Add locations to $PATH Variables=========================================

export PATH=$HOME/bin:$PATH

# Functions ===============================================================

function mkcd() {
  mkdir -p "$@" && cd "$_";
}


# fastfetch================================================================

fastfetch

figlet Devstack44!

# NVM node version manager export path =====================================================================
source $(brew --prefix nvm)/nvm.sh


# Set up fzf keybindings and fuzzy completions
eval "$(fzf --zsh)"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/jaimeledesma/.cache/lm-studio/bin"

export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"


