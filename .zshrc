# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color

 #Set name of the theme to load.
 export PNG_DIR=/usr/local
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$PATH:"/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/opt/local/bin:/opt/local/sbin"
alias ews="ssh -Y pendavi2@linux.ews.illinois.edu"
alias ews2="ssh -Y pendavi2@linux-a3.ews.illinois.edu"
alias ews3="ssh -Y pendavi2@linux-a1.ews.illinois.edu"
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
alias pandora="pianobar"
alias vim="/Applications/MacVim.app/Contents/MacOS/vim -p"
alias vi="/Applications/MacVim.app/Contents/MacOS/vim"
alias fish="while true; do say fish; done"
alias hidden="defaults write com.apple.finder AppleShowAllFiles YES; killall Finder"
alias nohidden="defaults write com.apple.finder AppleShowAllFiles NO; killall Finder"
alias 423="ssh cs423@sp16-cs423-g24.cs.illinois.edu"
alias 423s="ssh cs423@sp16-cs423-s-g24.cs.illinois.edu"

alias startdeb="vboxmanage startvm debian --type headless"
alias stopdeb="vboxmanage controlvm debian savestate"
alias killdeb="vboxmanage controlvm debian poweroff"
alias sshdeb="ssh -p 2222 bill@localhost"

alias startdebc="vboxmanage startvm debianClone --type headless"
alias stopdebc="vboxmanage controlvm debianClone savestate"
alias killdebc="vboxmanage controlvm debianClone poweroff"
alias sshdebc="ssh -p 2223 robert@localhost"

alias senddeb="scp -P 2222 -r  ~/Documents/School/ECE\ 438/transport-protocol/src/. bill@localhost:mp2/src/; scp -P 2223 -r  ~/Documents/School/ECE\ 438/transport-protocol/src/. robert@localhost:mp2/src/"

alias killkey="sudo kextunload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext/
"
alias unkillkey="sudo kextload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext/
"
alias kwm="nohup /usr/local/Cellar/kwm/2.2.0/kwm > ~/kwm.out 2>&1 &"
alias lpc="lpc21isp"
alias arm-gcc="arm-none-eabi-gcc"
alias weather="curl wttr.in"


#bindkey -v
#export KEYTIMEOUT=1
#function zle-line-init zle-keymap-select {
#    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]% %{$reset_color%}"
#        RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
#            zle reset-prompt
#        }
#zle -N zle-line-init
#zle -N zle-keymap-select
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export PATH="/usr/local/sbin:$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
