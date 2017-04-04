# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/cameron/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(ssh-agent archlinux docker zsh-nvm npm git git-extras pyenv sudo systemd colored-man-pages common-aliases wd extract fancy-ctrl-z)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

export EDITOR='nvim'
export GIT_EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias bim="echo 'I think you meant vim...\n';vim"
alias v="vim";
alias vim="nvim";

# Get rid of GTK errors in some apps
alias gitg="gitg 2>/dev/null"

export VIM_CONFIG='~/.config/nvim/init.vim'
alias vedit="~/.config/scripts/vedit"
#"vim $VIM_CONFIG"
#source /usr/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh

alias gprm='git push resin master'

# Tree for inside of a node project
alias node-tree='tree -I node_modules'

alias rm='echo "You should be using trash instead..."; false'
alias trash='trash-put'

alias vu='vagrant up'
alias vssh='vagrant ssh'
alias vh='vagrant halt'

export TERM='xterm-256color'
alias subl='subl3'
export PATH="$PATH:`dirname $(nvm which $(nvm current))`"
export PATH="$PATH:/opt/tools/arm-bcm2708/arm-bcm2708hardfp-linux-gnueabi/bin"
export PATH="$PATH:/home/cameron/.cabal/bin/"
export PATH="$PATH:/home/cameron/.local/bin/"
export PATH="$PATH:/home/cameron/.config/scripts/"
export PATH="$PATH:/home/cameron/.gem/ruby/2.4.0/bin"

PS1="%(1j.[%j] .)[%T] $PS1"

stty -ixon

# Enable base16 shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
