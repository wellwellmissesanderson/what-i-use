
# If you come from bash you might have to change your $PATH.
export PATH=<secret>

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
# ZSH_THEME="candy-kingdom"

ZSH_THEME="heather"
# ZSH_THEME="cloud"
# ZSH_THEME="dpoggi"
# ZSH_THEME="zsh2000"

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

plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
)

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

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias ll='ls -lGaf'

alias knit='all'
alias diff='git diff --cached'
alias push='git push origin HEAD'
alias reset='git reset --hard HEAD'
alias gitem='git shortlog -sn --all'
alias conv='f() { git commit --no-verify -m $1 };f'

function update() {
    # Updates the given branch to it's origin counterpart
    git branch -f ${1} origin/${1}
}

function updateAll() {
    git fetch --all -p
    # get other branches
    BRANCHES=$(git branch | cut -d " " -f 3)
    for branch in ${BRANCHES}; do
        update ${branch}
    done
    # update current branch
    git pull
}

function switch() {
    BRANCH=$1
    CURRENT_BRANCH=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
    CURRENT_TICKET=$(echo $CURRENT_BRANCH | sed 's:\([0-9]\)-.*$:\1:')

    # Errors
    if [[ $# -le 0 ]]; then
        echo "🎟  Please enter a JIRA ticket with the format PROJ-1234. Ex: CORE-4209"
        return
    elif [[ $CURRENT_BRANCH == *$BRANCH* ]]; then
        echo "🤠 Already there, cowboy"
        return
    fi

    MATCHES=$(git branch | grep $BRANCH -c)

    # if no matches
    if [[ $MATCHES = 0 ]]; then
        echo "🕳️  Big hole! (No matches)"
        return
    # if one match
    elif [[ $MATCHES = "1" ]]; then
        #MATCH=$(git branch | grep $BRANCH | xargs)
        echo "🧨 Away we go"

        git checkout $MATCH
        return
    else 
        echo "🤮 Found multiple branches:"
        MATCHES_LIST=$(git branch -a | grep $BRANCH)
        for _M in $MATCHES_LIST; do
            echo $_M
        done

        return
    fi
}

alias switch='switch $1'
alias ua='updateAll'
alias temp='sudo powermetrics --samplers smc |grep -i "CPU die temperature"'

#source ~/.nvm/nvm.sh


#export PATH=/opt/homebrew/opt/mysql-client@8.4/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"