# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
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

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

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
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias n='nvim'
alias spellbook='nvim'
alias magicwand='nvim ~/.config/nvim/init.lua'  # Edit your config
alias magic='cd && cd ~/.config/nvim/ && nvim .'  # Edit your config
alias wonderland='cd ~/.config/nvim'
alias scribble='nvim notes.md'  # A file for random thoughts


# quick navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias c='clear'
alias quf='cd && cd icode/quera/front'

# Directory Listing
alias ll='ls -la'
alias l='ls -CF'
alias la='ls -A'
alias lsd='ls -l | grep ^d'  # List directories only

# File operations
# alias mv='mv -i'  # Prompt before overwriting
# alias cp='cp -i'  # Prompt before overwriting
# alias rm='rm -i'  # Prompt before deleting

# File Explorer Integrations
alias e='nvim .'

# Simplify Git Commands
alias gs='git status'
alias ga='git add'
alias gc='git commit -v'
alias gca='git commit --amend'
alias gp='git push'
alias gl='git pull'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gd='git diff'
alias gb='git branch'
alias gclean='git clean -fd'
alias gr='git restore'
# View Logs and graphs
alias glog='git log --oneline --graph --decorate'
alias gitrekt='git reset --hard HEAD~1'
alias gitoops='git reset --soft HEAD~1'
alias commitlikeaboss='git commit -m "Big changes, don’t ask."'

# Networking
alias ping='ping -c 5'  # Limit pings to 5 packets
alias ports='netstat -tulanp'
alias myip='curl ifconfig.me'

# Programming Specific

# Python
alias py='python3'
alias ipy='ipython'
alias venv='python3 -m venv .venv && source .venv/bin/activate'

# Quick edit shell configs
alias bashconfig='nvim ~/.bashrc'
alias zshconfig='nvim ~/.zshrc'
alias reload='source ~/.bashrc'  # Reload shell configuration

# Super user shortcuts
alias please='sudo'
alias sorry='sudo'
alias kindly="sudo apt"

# Reminders of Humanity
alias dontpanic='echo "Grab your towel and keep coding!"'
alias chill='echo "Take a break. You deserve it!"'
alias procrastinate='echo "Why work now when future-you can handle it?"'
alias blamefutureme='echo "This is tomorrow’s problem."'
alias taskdone='echo "You did it! Go get a coffee!"'
alias goodjob='echo "Pat yourself on the back. You’re amazing!"'
alias golazy='echo "You’re procrastinating again, aren’t you?"'
# alias godamn='go build && echo "It works! Hallelujah!"'
alias gocoffee='echo "Compiling... time for coffee?"'
#

# Dramatic Directory Listing
alias behold='ls -lh'
alias showme='ls -la'

# For When You're Tired
alias idk='ls'
alias whatevs='cd ..'


# When Code Breaks
alias fixit='echo "Have you tried turning it off and on again?"'
# alias debug='echo "It’s not a bug, it’s a feature!"'

# View Everything
alias lol='nvim ~/.cheatsheets/funny-aliases.md'
alias lmao='nvim ~/.bash_aliases'

# Amir added
alias lets='cd icode && ls'
alias letsgo='cd icode/studies/go_studies && ls'
alias letslearngo='cd && cd icode/studies/go_studies/todd && clear && tree2'
alias letscode='cd icode/studies && ls'
alias names='apt list --upgradable'

alias mkpy3="source /home/adcodes/scripts/mkpy3"
alias delall="rm -rf ./*"

alias tree1='tree -L 1'
alias tree2='tree -L 2'
alias tree3='tree -L 3'
alias tree4='tree -L 4'
alias tree5='tree -L 5'
alias :q='exit'
alias letshavefunwithgo='cd && cd /home/adcodes/icode/studies/go_s/fun'
alias ztmgo='cd && cd /home/adcodes/icode/studies/go_s/ztm'
alias workshopgo='cd && cd /home/adcodes/ilearn/igo/work/'


# Path to your Oh My Zsh installation.
export PATH="$HOME/.local/kitty.app/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
alias python='/usr/bin/python3'
. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
. "/home/adcodes/.deno/env"
alias n='nvim'

# for Scripts
export PATH="$HOME/scripts:$PATH"

export WINEPREFIX=~/.local/share/wineprefixes/amir32
export EDITOR=nvim
export VISUAL=nvim
export PATH="$HOME/bin:$PATH"

export PATH=$HOME/.local/bin:$PATH

# for cuda (AI)
export PATH=/usr/local/cuda-11.8/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-11.8/lib64:$LD_LIBRARY_PATH
export PATH=$PATH:/usr/local/bin/llama/build/bin

alias kittyday="kitty --config ~/.config/kitty/kitty-day.conf"
alias kittynight="kitty --config ~/.config/kitty/kitty.conf"
alias kd="kitty --config ~/.config/kitty/kitty-day.conf"
alias kn="kitty --config ~/.config/kitty/kitty.conf"
export PATH="/var/lib/gems/3.0.0/bin:$PATH"
export PATH=$HOME/go/bin:$PATH


export XDG_DATA_DIRS=$XDG_DATA_DIRS:/var/lib/snapd/desktop
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/adcodes/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/adcodes/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/adcodes/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/adcodes/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export NV_PRIME_RENDER_OFFLOAD=1
export __GLX_VENDOR_LIBRARY_NAME=nvidia

# Create a basic pyrightconfig.json for Django/Python projects
init_pyright() {
  local target="${1:-.}"
  echo '{ "include": [ "." ], "extraPaths": [ "." ] }' > "$target/pyrightconfig.json"
  echo "✅ pyrightconfig.json created at $target"
}

alias pyi="init_pyright"
mpd-restart() {
  systemctl --user daemon-reexec
  systemctl --user restart mpd
}
