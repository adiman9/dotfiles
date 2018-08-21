# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/home/adiman/anaconda3/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

. ~/scripts/z.sh

export VISUAL="vim"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="agnoster"
ZSH_CUSTOM=~/customZsh
ZSH_THEME="adrian"
DEFAULT_USER="adrian"

if [ "$TERM" = "xterm" ]; then
  export TERM=xterm-256color
fi

alias 'sshadi'='ssh adiman999@adrianhenrydev.com'
alias 'ssht'='ssh root@104.131.4.253'
alias 'metavnc'='ssh -L 5901:127.0.0.1:5901 -N -f -l adiman 46.101.83.21; xtightvncviewer localhost:5901'
alias tmux='tmux -2'
alias tmdev='sh ~/scripts/tmux-dev.sh'
alias socpush='cd ~/Code\ Projects/Social\ Studies/webApp/ && npm run build && cp -r ~/Code\ Projects/Social\ Studies/webApp/images ~/Code\ Projects/Social\ Studies/webApp/build && mv ~/Code\ Projects/Social\ Studies/webApp/build/font/ ~/Code\ Projects/Social\ Studies/webApp/build/css/ && rsync -av ~/Code\ Projects/Social\ Studies/webApp/build/ adiman999@adrianhenrydev.com:~/public_html/testsite/socialstudies'
alias robpush='cd ~/Code\ Projects/rob\ lighting\ learning\ app/flashLearn && npm run build && rsync -av ~/Code\ Projects/rob\ lighting\ learning\ app/flashLearn/build/ adiman999@adrianhenrydev.com:~/public_html/testsite/robsayer'
alias bashrc='vim ~/.bashrc'
alias zshrc='vim ~/.zshrc'
alias code='cd ~/Code\ Projects/'
alias sz='. ~/.zshrc'
alias workoff='deactivate'
alias mew='cd ~/code/myetherwallet && live-server'
alias c="cd ~/code"
alias outlierdev="ssh -i ~/.ssh/google_compute_engine adrianhenry@dev-api.outlierintelligence.com"


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
plugins=(git)
plugins=(git zsh-completions)
autoload -U compinit && compinit

. $ZSH/oh-my-zsh.sh

# User configuration
. ~/scripts/z.sh

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
#
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"


export HEADSPIN_HOME=$HOME/headspinio
export HUNGRY_TURTLE_HOME=$HOME/code/hungryturtlecode
alias h="cd $HUNGRY_TURTLE_HOME"

export PATH=$HOME/.pyenv:$HOME/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.gem/ruby/2.4.0/bin:$HOME/anaconda3/bin
export PATH="$HOME/.rbenv/bin:$PATH"
export VIRTUALENVWRAPPER_PYTHON=~/.pyenv/shims/python
export WORKON_HOME=$HOME/.virtualenvs
. $HOME/scripts/virtualenvwrapper.sh

export PATH=/usr/local/go/bin:$PATH
export PATH=$HOME/code/devtools:$PATH
export PYTHON_CONFIGURE_OPTS="--enable-shared"

eval "$(pyenv init -)"
eval "$(rbenv init -)"

export GOPATH=$HOME/code

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export PATH=/Developer/NVIDIA/CUDA-7.0/bin:$PATH
export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-7.0/lib:$DYLD_LIBRARY_PATH

export EMSDK=$HOME/code/emsdk
export EM_CONFIG=$HOME/.emscripten
export BINARYEN_ROOT=$HOME/code/emsdk/clang/e1.38.0_64bit/binaryen
export EMSCRIPTEN=$HOME/code/emsdk/emscripten/1.38.0

export PATH=$HOME/code/emsdk:$PATH
export PATH=$HOME/code/emsdk/clang/e1.38.0_64bit:$PATH
export PATH=$HOME/code/emsdk/node/8.9.1_64bit/bin:$PATH
export PATH=$HOME/code/emsdk/emscripten/1.38.0:$PATH
export PATH=/usr/local/opt/llvm/bin:$PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/google-cloud-sdk/path.zsh.inc' ]; then source '/usr/local/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/google-cloud-sdk/completion.zsh.inc' ]; then source '/usr/local/google-cloud-sdk/completion.zsh.inc'; fi
